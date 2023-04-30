module "clusters" {
  source = "./modules/clusters"

  home_region = var.home_region

  tenancy_id = var.tenancy_id

  compartment_id = var.compartment_id

  label_prefix = var.label_prefix

  # ssh keys
  ssh_public_key_path = var.ssh_public_key_path

  # networking
  cidrs = var.cidrs

  connectivity_mode = var.connectivity_mode

  kubernetes_version = var.kubernetes_version

  # clusters

  admin_region = var.admin_region

  clusters = var.clusters

  control_plane_type = var.control_plane_type

  providers = {
    oci.home         = oci.home,
    oci.johannesburg = oci.johannesburg,
    oci.chuncheon    = oci.chuncheon,
    oci.hyderabad    = oci.hyderabad,
    oci.mumbai       = oci.mumbai,
    oci.osaka        = oci.osaka,
    oci.seoul        = oci.seoul,
    oci.singapore    = oci.singapore,
    oci.tokyo        = oci.tokyo,
    oci.amsterdam    = oci.amsterdam,
    oci.frankfurt    = oci.frankfurt,
    oci.london       = oci.london,
    oci.madrid       = oci.madrid,
    oci.marseille    = oci.marseille,
    oci.milan        = oci.milan,
    oci.newport      = oci.newport,
    oci.paris        = oci.paris,
    oci.stockholm    = oci.stockholm,
    oci.zurich       = oci.zurich,
    oci.abudhabi     = oci.abudhabi,
    oci.dubai        = oci.dubai,
    oci.jeddah       = oci.jeddah,
    oci.jerusalem    = oci.jerusalem,
    oci.melbourne    = oci.melbourne,
    oci.sydney       = oci.sydney,
    oci.santiago     = oci.santiago,
    oci.saupaulo     = oci.saupaulo,
    oci.vinhedo      = oci.vinhedo,
    oci.ashburn      = oci.ashburn,
    oci.chicago      = oci.chicago,
    oci.montreal     = oci.montreal,
    oci.phoenix      = oci.phoenix,
    oci.queretaro    = oci.queretaro,
    oci.sanjose      = oci.sanjose,
    oci.toronto      = oci.toronto
  }
}

module "verrazzano" {
  source = "./modules/verrazzano"

  bastion_ip = module.admin.bastion_public_ip

  operator_ip = module.admin.operator_private_ip

  ssh_private_key_path = var.ssh_private_key_path

  verrazzano_version = var.verrazzano_version

  install_verrazzano = var.install_verrazzano

  admin_region = var.admin_region

  verrazzano_profile = var.verrazzano_profile

  cluster_ids = merge({ "admin" = module.admin.cluster_id }, module.clusters.cluster_ids)

  int_nsg_ids = merge({ "admin" = lookup(module.admin.nsg_ids, "int_lb") }, module.clusters.int_nsg_ids)

  pub_nsg_ids = merge({ "admin" = lookup(module.admin.nsg_ids, "pub_lb") }, module.clusters.pub_nsg_ids)

  configure_dns = var.configure_dns

  secret_id = var.secret_id

  dns_zone_id = var.dns_zone_id

  dns_compartment_id = var.dns_compartment_id

  dns_zone_name = var.dns_zone_name

  depends_on = [
    module.clusters
  ]

  count = var.configure_clusters == true ? 1 : 0
}
