# # Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# # Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

# module "hyderabad" {
#   source  = "oracle-terraform-modules/oke/oci"
#   version = "4.5.9"

#   home_region = var.home_region
#   region      = local.regions["hyderabad"]

#   tenancy_id = var.tenancy_id

#   # general oci parameters
#   compartment_id = var.compartment_id
#   label_prefix   = var.label_prefix

#   # ssh keys
#   ssh_private_key_path = "~/.ssh/id_rsa"
#   ssh_public_key_path  = "~/.ssh/id_rsa.pub"

#   # networking
#   create_drg       = true
#   drg_display_name = "hyderabad"

#   remote_peering_connections = var.connectivity_mode == "mesh" ? { for k, v in merge({ "admin" = true }, var.clusters) : "rpc-to-${k}" => {} if tobool(v) && k != "hyderabad" } : { "rpc-to-admin" : {} }

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
#     } if tobool(lookup(var.clusters, c) && c != "hyderabad")] : []
#   )

#   vcn_cidrs     = [lookup(lookup(var.cidrs, lower("hyderabad")), "vcn")]
#   vcn_dns_label = "hyderabad"
#   vcn_name      = "hyderabad"

#   # bastion host
#   create_bastion_host = false

#   # operator host
#   create_operator                    = false
#   enable_operator_instance_principal = false


#   # oke cluster options
#   allow_worker_ssh_access     = false
#   cluster_name                = "hyderabad"
#   control_plane_type          = var.oke_control_plane
#   cni_type                    = var.preferred_cni
#   control_plane_allowed_cidrs = ["0.0.0.0/0"]
#   kubernetes_version          = var.kubernetes_version
#   pods_cidr                   = lookup(lookup(var.cidrs, lower("hyderabad")), "pods")
#   services_cidr               = lookup(lookup(var.cidrs, lower("hyderabad")), "services")


#   # node pools
#   kubeproxy_mode = "ipvs"
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
#     oci      = oci.hyderabad
#     oci.home = oci.home
#   }

#   count = tobool(lookup(var.clusters, "hyderabad")) ? 1 : 0

# }

# module "mumbai" {
#   source  = "oracle-terraform-modules/oke/oci"
#   version = "4.5.9"

#   home_region = var.home_region
#   region      = local.regions["mumbai"]

#   tenancy_id = var.tenancy_id

#   # general oci parameters
#   compartment_id = var.compartment_id
#   label_prefix   = var.label_prefix

#   # ssh keys
#   ssh_private_key_path = "~/.ssh/id_rsa"
#   ssh_public_key_path  = "~/.ssh/id_rsa.pub"

#   # networking
#   create_drg       = true
#   drg_display_name = "mumbai"

#   remote_peering_connections = var.connectivity_mode == "mesh" ? { for k, v in merge({ "admin" = true }, var.clusters) : "rpc-to-${k}" => {} if tobool(v) && k != "mumbai" } : { "rpc-to-admin" : {} }

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
#     } if tobool(lookup(var.clusters, c) && c != "mumbai")] : []
#   )

#   vcn_cidrs     = [lookup(lookup(var.cidrs, lower("mumbai")), "vcn")]
#   vcn_dns_label = "mumbai"
#   vcn_name      = "mumbai"

#   # bastion host
#   create_bastion_host = false

#   # operator host
#   create_operator                    = false
#   enable_operator_instance_principal = false


#   # oke cluster options
#   allow_worker_ssh_access     = false
#   cluster_name                = "mumbai"
#   control_plane_type          = var.oke_control_plane
#   cni_type                    = var.preferred_cni
#   control_plane_allowed_cidrs = ["0.0.0.0/0"]
#   kubernetes_version          = var.kubernetes_version
#   pods_cidr                   = lookup(lookup(var.cidrs, lower("mumbai")), "pods")
#   services_cidr               = lookup(lookup(var.cidrs, lower("mumbai")), "services")


#   # node pools
#   kubeproxy_mode = "ipvs"
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
#     oci      = oci.mumbai
#     oci.home = oci.home
#   }

#   count = tobool(lookup(var.clusters, "mumbai")) ? 1 : 0

# }

