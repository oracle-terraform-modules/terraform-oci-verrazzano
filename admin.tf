# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

module "admin" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "4.5.9"

  home_region = local.admin_region
  region      = local.admin_region

  tenancy_id = var.tenancy_id

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = var.label_prefix

  # ssh keys
  ssh_private_key_path = var.ssh_private_key_path
  ssh_public_key_path  = var.ssh_public_key_path

  # networking
  create_drg       = true
  drg_display_name = lookup(var.admin_region, "admin_name")

  # admin is always connected to everybody
  remote_peering_connections = {
    for k, v in var.managed_clusters : "rpc-to-${k}" => {} if tobool(v)
  }


  internet_gateway_route_rules = [
    for c in keys(var.managed_clusters) :
    {
      destination       = lookup(lookup(var.cidrs, c), "vcn")
      destination_type  = "CIDR_BLOCK"
      network_entity_id = "drg"
      description       = "Routing to allow ssh to ${title(c)}"
    } if tobool(lookup(var.managed_clusters, c))
  ]

  nat_gateway_route_rules = [
    for c in keys(var.managed_clusters) :
    {
      destination       = lookup(lookup(var.cidrs, c), "vcn")
      destination_type  = "CIDR_BLOCK"
      network_entity_id = "drg"
      description       = "Routing to allow connectivity to ${title(c)} cluster"
    } if tobool(lookup(var.managed_clusters, c))
  ]

  vcn_cidrs     = [lookup(var.admin_region, "vcn_cidr")]
  vcn_dns_label = lookup(var.admin_region, "admin_name")
  vcn_name      = lookup(var.admin_region, "admin_name")


  # bastion host
  create_bastion_host = true
  upgrade_bastion     = false

  # operator host
  create_operator                    = true
  upgrade_operator                   = false
  enable_operator_instance_principal = true

  # oke cluster options
  cluster_name                = lookup(var.admin_region, "admin_name")
  cni_type                    = var.preferred_cni
  control_plane_type          = var.oke_control_plane
  control_plane_allowed_cidrs = ["0.0.0.0/0"]
  kubernetes_version          = var.kubernetes_version
  pods_cidr                   = lookup(var.admin_region, "pods")
  services_cidr               = lookup(var.admin_region, "services")


  # node pools
  kubeproxy_mode = "ipvs"
  node_pools     = var.nodepools

  cloudinit_nodepool_common = var.cloudinit_nodepool_common

  node_pool_image_type = "oke"

  # oke load balancers
  load_balancers            = "both"
  preferred_load_balancer   = "public"
  internal_lb_allowed_cidrs = ["0.0.0.0/0"]
  internal_lb_allowed_ports = var.connectivity_mode == "mesh" ? [80, 443, 15012, 15017, 15021, 15443] : [80, 443]
  public_lb_allowed_cidrs   = ["0.0.0.0/0"]
  public_lb_allowed_ports   = [80, 443, 15021]

  user_id = var.user_id

  providers = {
    oci      = oci.sydney
    oci.home = oci.home
  }
}
