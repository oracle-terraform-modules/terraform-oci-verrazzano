# # Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# # Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

# module "seoul" {
#   source  = "oracle-terraform-modules/oke/oci"
#   version = "5.0.0-RC4"

#   home_region = var.home_region
#   region      = local.regions["seoul"]

#   tenancy_id = var.tenancy_id

#   # general oci parameters
#   compartment_id = var.compartment_id

#   # ssh key
#   ssh_public_key_path  = var.ssh_public_key_path

#   # networking
#   create_drg       = true
#   drg_display_name = "seoul"

#   #   remote_peering_connections = var.connectivity_mode == "mesh" ? { for k, v in merge({ "admin" = true }, var.clusters) : "rpc-to-${k}" => {} if tobool(v) && k != "seoul" } : { "rpc-to-admin" : {} }

#   nat_gateway_route_rules = concat([
#     {
#       destination       = lookup(var.admin_region, "vcn_cidr")
#       destination_type  = "CIDR_BLOCK"
#       network_entity_id = "drg"
#       description       = "To Admin"
#     }], var.connectivity_mode == "mesh" ?
#     [for c in keys(var.clusters) :
#       {
#         destination       = lookup(lookup(var.cidrs, c), "vcn")
#         destination_type  = "CIDR_BLOCK"
#         network_entity_id = "drg"
#         description       = "Routing to allow connectivity to ${title(c)} cluster"
#     } if tobool(lookup(var.clusters, c) && c != "seoul")] : []
#   )

#   vcn_cidrs     = [lookup(lookup(var.cidrs, lower("seoul")), "vcn")]
#   vcn_dns_label = "seoul"
#   vcn_name      = "seoul"

#   #subnets
#   subnets = {
#     cp      = { newbits = 13, dns_label = "cp" }
#     int_lb  = { newbits = 11, dns_label = "ilb" }
#     pub_lb  = { newbits = 11, dns_label = "plb" }
#     workers = { newbits = 2, dns_label = "workers" }
#     pods    = { newbits = 2, dns_label = "pods" }
#   }

#   # bastion host
#   create_bastion = false

#   # operator host
#   create_operator                    = false
#   create_iam_operator_policy = "never"


#   # oke cluster options
#   cluster_name                = "seoul"
#   cluster_type                = var.cluster_type
#   cni_type                    = var.preferred_cni
#   control_plane_is_public     = var.oke_control_plane == "public"
#   control_plane_allowed_cidrs = [local.anywhere]
#   kubernetes_version          = var.kubernetes_version
#   pods_cidr                   = lookup(var.admin_region, "pods")
#   services_cidr               = lookup(var.admin_region, "services")

#   allow_worker_ssh_access = false

#   # node pools
#   kubeproxy_mode   = "ipvs"
#   worker_pool_mode = "node-pool"

#   worker_pools = var.nodepools

#   worker_cloud_init = var.worker_cloud_init

#   worker_image_type = "oke"


#   # oke load balancers
#   load_balancers          = "both"
#   preferred_load_balancer = "public"

#   allow_rules_internal_lb = {
#     for p in local.service_mesh_ports :

#     format("Allow ingress to port %v", p) => {
#       protocol = local.tcp_protocol, port = p, source = "10.0.0.0/16", source_type = local.rule_type_cidr,
#     }
#   }
#   # internal_lb_allowed_ports = var.connectivity_mode == "mesh" ? [80, 443, 15012, 15017, 15021, 15443] : [80, 443]
#   # TODO: allow configuration of source cidr
#   allow_rules_public_lb = {

#     for p in local.public_lb_allowed_ports :

#     format("Allow ingress to port %v", p) => {
#       protocol = local.tcp_protocol, port = p, source = "0.0.0.0/0", source_type = local.rule_type_cidr,
#     }
#   }

# #   user_id = var.user_id

#   providers = {
#     oci      = oci.seoul
#     oci.home = oci.home
#   }

#   count = tobool(lookup(var.clusters, "seoul")) ? 1 : 0

# }

# resource "oci_objectstorage_bucket" "thanos_seoul" {
#   compartment_id = var.compartment_id
#   name           = "${var.label_prefix}-${lookup(var.thanos, "bucket_name", "thanos")}"
#   namespace      = lookup(var.thanos, "bucket_namespace")

#   provider = oci.seoul

#   count = tobool(lookup(var.clusters, "seoul", "false")) && tobool(lookup(var.thanos, "enabled", "false")) ? 1 : 0
# }

# module "seoul_drg" {
#   source  = "oracle-terraform-modules/drg/oci"
#   version = "1.0.5"

#   # general oci parameters
#   compartment_id = var.compartment_id
#   label_prefix   = var.label_prefix

#   # drg parameters
#   drg_display_name = "seoul-drg"

#   drg_vcn_attachments = {
#     drg = {
#       vcn_id                    = module.seoul[0].vcn_id
#       vcn_transit_routing_rt_id = null
#       drg_route_table_id        = null
#     }
#   }

#   # var.drg_id can either contain an existing DRG ID or be null. 
#   drg_id = null

#   remote_peering_connections = var.connectivity_mode == "mesh" ? { for k, v in merge({ "admin" = true }, var.clusters) : "rpc-to-${k}" => {} if tobool(v) && k != "seoul" } : { "rpc-to-admin" : {} }

#   count = tobool(lookup(var.clusters, "seoul", "false")) ? 1 : 0
#   providers = {
#     oci = oci.seoul
#   }
# }