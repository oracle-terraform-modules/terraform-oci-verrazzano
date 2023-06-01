# # Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# # Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

# module "ashburn" {
#   source  = "oracle-terraform-modules/oke/oci"
#   version = "4.5.9"

#   home_region = var.home_region
#   region      = local.regions["ashburn"]

#   tenancy_id = var.tenancy_id

#   # general oci parameters
#   compartment_id = var.compartment_id
#   label_prefix   = var.label_prefix

#   # ssh keys
#   ssh_private_key_path = "~/.ssh/id_rsa"
#   ssh_public_key_path  = "~/.ssh/id_rsa.pub"

#   # networking
#   create_drg       = true
#   drg_display_name = "ashburn"

#   remote_peering_connections = var.connectivity_mode == "mesh" ? { for k, v in merge({ "admin" = true }, var.clusters) : "rpc-to-${k}" => {} if tobool(v) && k != "ashburn" } : { "rpc-to-admin" : {} }

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
#     } if tobool(lookup(var.clusters, c) && c != "ashburn")] : []
#   )

#   vcn_cidrs     = [lookup(lookup(var.cidrs, lower("ashburn")), "vcn")]
#   vcn_dns_label = "ashburn"
#   vcn_name      = "ashburn"

#   # bastion host
#   create_bastion_host = false

#   # operator host
#   create_operator                    = false
#   enable_operator_instance_principal = false


#   # oke cluster options
#   allow_worker_ssh_access     = false
#   cluster_name                = "ashburn"
#   control_plane_type          = var.oke_control_plane
#   control_plane_allowed_cidrs = ["0.0.0.0/0"]
#   kubernetes_version          = var.kubernetes_version
#   pods_cidr                   = lookup(lookup(var.cidrs, lower("ashburn")), "pods")
#   services_cidr               = lookup(lookup(var.cidrs, lower("ashburn")), "services")


#   # node pools
#   node_pools = local.managed_nodepools
#   cloudinit_nodepool_common = var.cloudinit_nodepool_common

#   node_pool_image_type = "oke"

#   # oke load balancers
#   load_balancers            = "both"
#   preferred_load_balancer   = "public"
#   internal_lb_allowed_cidrs = [lookup(var.admin_region, "vcn_cidr")]
#   internal_lb_allowed_ports = var.connectivity_mode == "mesh" ? [80, 443, 15012, 15017, 15021, 15443] : [80, 443]
#   public_lb_allowed_cidrs   = ["0.0.0.0/0"]
#   public_lb_allowed_ports   = [80, 443]

#   providers = {
#     oci      = oci.ashburn
#     oci.home = oci.home
#   }

#   count = lookup(var.clusters, "ashburn") == true ? 1 : 0

# }

# module "phoenix" {
#   source  = "oracle-terraform-modules/oke/oci"
#   version = "4.5.9"

#   home_region = var.home_region
#   region      = local.regions["phoenix"]

#   tenancy_id = var.tenancy_id

#   # general oci parameters
#   compartment_id = var.compartment_id
#   label_prefix   = var.label_prefix

#   # ssh keys
#   ssh_private_key_path = "~/.ssh/id_rsa"
#   ssh_public_key_path  = "~/.ssh/id_rsa.pub"

#   # networking
#   create_drg       = true
#   drg_display_name = "phoenix"

#   remote_peering_connections = var.connectivity_mode == "mesh" ? { for k, v in merge({ "admin" = true }, var.clusters) : "rpc-to-${k}" => {} if tobool(v) && k != "phoenix" } : { "rpc-to-admin" : {} }

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
#     } if tobool(lookup(var.clusters, c) && c != "phoenix")] : []
#   )

#   vcn_cidrs     = [lookup(lookup(var.cidrs, lower("phoenix")), "vcn")]
#   vcn_dns_label = "phoenix"
#   vcn_name      = "phoenix"

#   # bastion host
#   create_bastion_host = false

#   # operator host
#   create_operator                    = false
#   enable_operator_instance_principal = false


#   # oke cluster options
#   allow_worker_ssh_access     = false
#   cluster_name                = "phoenix"
#   control_plane_type          = var.oke_control_plane
#   control_plane_allowed_cidrs = ["0.0.0.0/0"]
#   kubernetes_version          = var.kubernetes_version
#   pods_cidr                   = lookup(lookup(var.cidrs, lower("phoenix")), "pods")
#   services_cidr               = lookup(lookup(var.cidrs, lower("phoenix")), "services")


#   # node pools
#   node_pools = local.managed_nodepools
#   cloudinit_nodepool_common = var.cloudinit_nodepool_common

#   node_pool_image_type = "oke"

#   # oke load balancers
#   load_balancers            = "both"
#   preferred_load_balancer   = "public"
#   internal_lb_allowed_cidrs = [lookup(var.admin_region, "vcn_cidr")]
#   internal_lb_allowed_ports = var.connectivity_mode == "mesh" ? [80, 443, 15012, 15017, 15021, 15443] : [80, 443]
#   public_lb_allowed_cidrs   = ["0.0.0.0/0"]
#   public_lb_allowed_ports   = [80, 443]

#   providers = {
#     oci      = oci.phoenix
#     oci.home = oci.home
#   }

#   count = lookup(var.clusters, "phoenix") == true ? 1 : 0

# }

# module "sanjose" {
#   source  = "oracle-terraform-modules/oke/oci"
#   version = "4.5.9"

#   home_region = var.home_region
#   region      = local.regions["sanjose"]

#   tenancy_id = var.tenancy_id

#   # general oci parameters
#   compartment_id = var.compartment_id
#   label_prefix   = var.label_prefix

#   # ssh keys
#   ssh_private_key_path = "~/.ssh/id_rsa"
#   ssh_public_key_path  = "~/.ssh/id_rsa.pub"

#   # networking
#   create_drg       = true
#   drg_display_name = "sanjose"

#   remote_peering_connections = var.connectivity_mode == "mesh" ? { for k, v in merge({ "admin" = true }, var.clusters) : "rpc-to-${k}" => {} if tobool(v) && k != "sanjose" } : { "rpc-to-admin" : {} }

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
#     } if tobool(lookup(var.clusters, c) && c != "sanjose")] : []
#   )

#   vcn_cidrs     = [lookup(lookup(var.cidrs, lower("sanjose")), "vcn")]
#   vcn_dns_label = "sanjose"
#   vcn_name      = "sanjose"

#   # bastion host
#   create_bastion_host = false

#   # operator host
#   create_operator                    = false
#   enable_operator_instance_principal = false


#   # oke cluster options
#   allow_worker_ssh_access     = true
#   cluster_name                = "sanjose"
#   control_plane_type          = var.oke_control_plane
#   control_plane_allowed_cidrs = ["0.0.0.0/0"]
#   kubernetes_version          = var.kubernetes_version
#   pods_cidr                   = lookup(lookup(var.cidrs, lower("sanjose")), "pods")
#   services_cidr               = lookup(lookup(var.cidrs, lower("sanjose")), "services")


#   # node pools
#   node_pools = local.managed_nodepools
#   cloudinit_nodepool_common = var.cloudinit_nodepool_common

#   node_pool_image_type = "oke"

#   # oke load balancers
#   load_balancers            = "both"
#   preferred_load_balancer   = "public"
#   internal_lb_allowed_cidrs = [lookup(var.admin_region, "vcn_cidr")]
#   internal_lb_allowed_ports = var.connectivity_mode == "mesh" ? [80, 443, 15012, 15017, 15021, 15443] : [80, 443]
#   public_lb_allowed_cidrs   = ["0.0.0.0/0"]
#   public_lb_allowed_ports   = [80, 443]

#   providers = {
#     oci      = oci.sanjose
#     oci.home = oci.home
#   }

#   count = lookup(var.clusters, "sanjose") == true ? 1 : 0

# }

# module "chicago" {
#   source  = "oracle-terraform-modules/oke/oci"
#   version = "4.5.9"

#   home_region = var.home_region
#   region      = local.regions["chicago"]

#   tenancy_id = var.tenancy_id

#   # general oci parameters
#   compartment_id = var.compartment_id
#   label_prefix   = var.label_prefix

#   # ssh keys
#   ssh_private_key_path = "~/.ssh/id_rsa"
#   ssh_public_key_path  = "~/.ssh/id_rsa.pub"

#   # networking
#   create_drg       = true
#   drg_display_name = "chicago"

#   remote_peering_connections = var.connectivity_mode == "mesh" ? { for k, v in merge({ "admin" = true }, var.clusters) : "rpc-to-${k}" => {} if tobool(v) && k != "chicago" } : { "rpc-to-admin" : {} }

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
#     } if tobool(lookup(var.clusters, c) && c != "chicago")] : []
#   )

#   vcn_cidrs     = [lookup(lookup(var.cidrs, lower("chicago")), "vcn")]
#   vcn_dns_label = "chicago"
#   vcn_name      = "chicago"

#   # bastion host
#   create_bastion_host = false

#   # operator host
#   create_operator                    = false
#   enable_operator_instance_principal = false


#   # oke cluster options
#   allow_worker_ssh_access     = true
#   cluster_name                = "chicago"
#   control_plane_type          = var.oke_control_plane
#   control_plane_allowed_cidrs = ["0.0.0.0/0"]
#   kubernetes_version          = var.kubernetes_version
#   pods_cidr                   = lookup(lookup(var.cidrs, lower("chicago")), "pods")
#   services_cidr               = lookup(lookup(var.cidrs, lower("chicago")), "services")


#   # node pools
#   node_pools = local.managed_nodepools
#   cloudinit_nodepool_common = var.cloudinit_nodepool_common

#   node_pool_image_type = "oke"

#   # oke load balancers
#   load_balancers            = "both"
#   preferred_load_balancer   = "public"
#   internal_lb_allowed_cidrs = [lookup(var.admin_region, "vcn_cidr")]
#   internal_lb_allowed_ports = var.connectivity_mode == "mesh" ? [80, 443, 15012, 15017, 15021, 15443] : [80, 443]
#   public_lb_allowed_cidrs   = ["0.0.0.0/0"]
#   public_lb_allowed_ports   = [80, 443]

#   providers = {
#     oci      = oci.chicago
#     oci.home = oci.home
#   }

#   count = lookup(var.clusters, "chicago") == true ? 1 : 0

# }