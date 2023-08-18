# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

locals {
  all_ports = -1

  # keep as reference
  # apiserver_port          = 6443

  # Protocols
  # See https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
  all_protocols = "all"
  icmp_protocol = 1
  tcp_protocol  = 6
  udp_protocol  = 17

  anywhere          = "0.0.0.0/0"
  rule_type_nsg     = "NETWORK_SECURITY_GROUP"
  rule_type_cidr    = "CIDR_BLOCK"
  rule_type_service = "SERVICE_CIDR_BLOCK"

  service_mesh_ports = [80, 443, 15012, 15017, 15021, 15443]

  # Todo verify if we need 15021 open for public
  public_lb_allowed_ports = [80, 443, 15021]
}

module "admin" {

  source  = "oracle-terraform-modules/oke/oci"
  version = "5.0.0-RC3"

  home_region = local.admin_region
  region      = local.admin_region

  tenancy_id = var.tenancy_id

  # general oci parameters
  compartment_id = var.compartment_id

  # ssh keys
  ssh_private_key_path = var.ssh_private_key_path
  ssh_public_key_path  = var.ssh_public_key_path

  # networking
  # create_drg       = true
  drg_display_name = lookup(var.admin_region, "admin_name")

  internet_gateway_route_rules = [
    for c in keys(var.managed_clusters) :
    {
      destination       = lookup(lookup(var.cidrs, c), "vcn")
      destination_type  = "CIDR_BLOCK"
      network_entity_id = module.admin_drg.drg_id
      description       = "Routing to allow ssh to ${title(c)}"
    } if tobool(lookup(var.managed_clusters, c))
  ]

  nat_gateway_route_rules = [
    for c in keys(var.managed_clusters) :
    {
      destination       = lookup(lookup(var.cidrs, c), "vcn")
      destination_type  = "CIDR_BLOCK"
      network_entity_id = module.admin_drg.drg_id
      description       = "Routing to allow connectivity to ${title(c)} cluster"
    } if tobool(lookup(var.managed_clusters, c))
  ]

  vcn_cidrs     = [lookup(var.admin_region, "vcn_cidr")]
  vcn_dns_label = lookup(var.admin_region, "admin_name")
  vcn_name      = lookup(var.admin_region, "admin_name")

  #subnets
  subnets = {
    bastion  = { newbits = 13, netnum = 0, dns_label = "bastion" }
    operator = { newbits = 13, netnum = 1, dns_label = "operator" }
    cp       = { newbits = 13, netnum = 2, dns_label = "cp" }
    int_lb   = { newbits = 11, netnum = 16, dns_label = "ilb" }
    pub_lb   = { newbits = 11, netnum = 17, dns_label = "plb" }
    workers  = { newbits = 2, netnum = 1, dns_label = "workers" }
    pods     = { newbits = 2, netnum = 2, dns_label = "pods" }
  }

  # bastion host
  create_bastion        = true
  bastion_allowed_cidrs = ["0.0.0.0/0"]
  bastion_upgrade       = false

  # operator host
  create_operator            = true
  operator_upgrade           = false
  create_iam_resources       = true
  create_iam_operator_policy = "always"
  operator_install_k9s       = true

  # oke cluster options
  cluster_name                = lookup(var.admin_region, "admin_name")
  cni_type                    = var.preferred_cni
  control_plane_is_public     = var.oke_control_plane == "public"
  control_plane_allowed_cidrs = [local.anywhere]
  kubernetes_version          = var.kubernetes_version
  pods_cidr                   = lookup(var.admin_region, "pods")
  services_cidr               = lookup(var.admin_region, "services")


  # node pools
  kubeproxy_mode    = "ipvs"
  worker_pool_mode  = "node-pool"
  worker_pools      = var.nodepools
  worker_cloud_init = var.worker_cloud_init
  worker_image_type = "oke"

  # oke load balancers
  load_balancers          = "both"
  preferred_load_balancer = "public"

  allow_rules_internal_lb = {
    for p in local.service_mesh_ports :

    format("Allow ingress to port %v", p) => {
      protocol = local.tcp_protocol, port = p, source = "10.0.0.0/16", source_type = local.rule_type_cidr,
    }
  }
  # internal_lb_allowed_ports = var.connectivity_mode == "mesh" ? [80, 443, 15012, 15017, 15021, 15443] : [80, 443]
  # TODO: allow configuration of source cidr

  allow_rules_public_lb = {
    for p in local.public_lb_allowed_ports :

    format("Allow ingress to port %v", p) => {
      protocol = local.tcp_protocol, port = p, source = "0.0.0.0/0", source_type = local.rule_type_cidr,
    }
  }

  user_id = var.user_id

  providers = {
    oci      = oci.sydney
    oci.home = oci.home
  }
}

resource "oci_objectstorage_bucket" "thanos_admin" {
  compartment_id = var.compartment_id
  name           = "${lookup(var.admin_region, "admin_name")}-${lookup(var.thanos, "bucket_name", "thanos")}"
  namespace      = lookup(var.thanos, "bucket_namespace")

  provider = oci.sydney

  count = tobool(lookup(var.thanos, "enabled", "false")) ? 1 : 0
}


module "admin_drg" {
  source  = "oracle-terraform-modules/drg/oci"
  version = "1.0.5"

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = var.label_prefix

  # drg parameters
  drg_display_name = "${lookup(var.admin_region, "admin_name")}-drg"

  drg_vcn_attachments = {
    drg = {
      vcn_id                    = module.admin.vcn_id
      vcn_transit_routing_rt_id = null
      drg_route_table_id        = null
    }
  }

  # var.drg_id can either contain an existing DRG ID or be null. 
  drg_id = null

  # admin is always connected to everybody
  remote_peering_connections = {
    for k, v in var.managed_clusters : "rpc-to-${k}" => {} if tobool(v)
  }

  providers = {
    oci = oci.sydney
  }

  count = tobool(lookup(var.admin_region, "create_drg", "false")) ? 1 : 0
}
