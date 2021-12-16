module "oke" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "4.0.3"

  home_region = var.home_region
  region      = var.region

  tenancy_id = var.tenancy_id

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = var.label_prefix

  # ssh keys
  ssh_private_key_path = var.ssh_private_key_path
  ssh_public_key_path  = var.ssh_public_key_path

  # networking
  create_drg                   = var.verrazzano_profile == "admin" || var.verrazzano_profile == "managed" ? true : false
  internet_gateway_route_rules = []
  nat_gateway_route_rules      = []

  vcn_cidrs     = var.vcn_cidrs
  vcn_dns_label = var.vcn_dns_label
  vcn_name      = var.vcn_name

  # bastion host
  create_bastion_host = var.verrazzano_profile == "managed" ? false : true
  upgrade_bastion     = false

  # operator host
  create_operator                    = var.verrazzano_profile == "managed" ? false : true
  enable_operator_instance_principal = true
  upgrade_operator                   = false

  # oke cluster options
  cluster_name                = "${var.region}-${var.cluster_name}"
  control_plane_type          = "private"
  control_plane_allowed_cidrs = var.control_plane_allowed_cidrs
  kubernetes_version          = var.kubernetes_version
  pods_cidr                   = var.pods_cidr
  services_cidr               = var.services_cidr

  # node pools
  node_pool_name_prefix = var.node_pool_name_prefix

  node_pools = {
    np1 = { shape = "VM.Standard.E4.Flex", ocpus = 2, memory = 32, node_pool_size = 2, boot_volume_size = 150, label = { app = "frontend", pool = "np1" } }
  }

  # oke load balancers
  load_balancers          = var.load_balancers
  preferred_load_balancer = var.preferred_load_balancer

  # oke internal load balancer
  internal_lb_allowed_cidrs = var.internal_lb_allowed_cidrs
  internal_lb_allowed_ports = var.internal_lb_allowed_ports

  # oke public load balancer
  public_lb_allowed_cidrs = var.public_lb_allowed_cidrs
  public_lb_allowed_ports = var.public_lb_allowed_ports

  # freeform_tags
  freeform_tags = var.freeform_tags

  providers = {
    oci.home = oci.home
  }
}
