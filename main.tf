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

  clusters = var.managed_clusters

  cluster_type = var.cluster_type

  oke_control_plane = var.oke_control_plane

  preferred_cni = var.preferred_cni

  worker_cloud_init = var.worker_cloud_init

  nodepools = var.nodepools

  thanos = var.thanos

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

  label_prefix = var.label_prefix

  bastion_ip = module.admin.bastion_public_ip

  operator_ip = module.admin.operator_private_ip

  ssh_private_key_path = var.ssh_private_key_path
  cluster_type         = var.cluster_type

  # verrazzano
  install_verrazzano = var.install_verrazzano
  verrazzano_version = var.verrazzano_version

  # verrazzano infrastructure
  admin_region             = var.admin_region
  oke_control_plane        = var.oke_control_plane
  verrazzano_profile       = var.verrazzano_profile
  verrazzano_control_plane = var.verrazzano_control_plane
  verrazzano_data_plane    = var.verrazzano_data_plane
  verrazzano_load_balancer = var.verrazzano_load_balancer
  all_cluster_ids          = merge({ lookup(var.admin_region, "admin_name", "admin") = module.admin.cluster_id }, local.managed_clusters)
  managed_cluster_ids      = local.managed_clusters
  int_nsg_ids              = merge({ lookup(var.admin_region, "admin_name", "admin") = module.admin.int_lb_nsg_id }, local.cluster_int_nsg_ids)
  int_lb_subnet_ids        = merge({ lookup(var.admin_region, "admin_name", "admin") = module.admin.int_lb_subnet_id }, local.cluster_int_lb_subnet_ids)
  pub_nsg_ids              = merge({ lookup(var.admin_region, "admin_name", "admin") = module.admin.pub_lb_nsg_id }, local.cluster_pub_nsg_ids)

  # verrazzano components
  argocd                = var.argocd
  cluster_api           = var.cluster_api
  coherence             = var.coherence
  configure_dns         = var.configure_dns
  console               = var.console
  fluentd               = var.fluentd
  grafana               = var.grafana
  jaeger                = var.jaeger
  kiali                 = var.kiali
  kube_state_metrics    = var.kube_state_metrics
  opensearch            = var.opensearch
  opensearch_dashboards = var.opensearch_dashboards
  prometheus            = var.prometheus
  prometheus_operator   = var.prometheus_operator
  rancher               = var.rancher
  thanos                = var.thanos
  velero                = var.velero
  weblogic_operator     = var.weblogic_operator

  # dns
  dns_compartment_id = var.dns_compartment_id
  dns_secret_id      = var.dns_secret_id
  dns_zone_id        = var.dns_zone_id
  dns_zone_name      = var.dns_zone_name

  # istio
  mesh_id     = var.mesh_id
  istio_model = var.istio_model

  depends_on = [
    module.clusters
  ]

  count = tobool(var.get_kubeconfigs) ? 1 : 0
}

resource "oci_identity_policy" "workload-identity" {
  provider       = oci.home
  compartment_id = var.compartment_id
  description    = format("Workload Identity Policy for OKE clusters to write metrics to Object Storage")
  name           = format("oke-%v-%s", "thanos", module.admin.state_id)
  statements     = flatten(local.thanos_policy_statement)

  lifecycle {
    ignore_changes = [defined_tags, freeform_tags]
  }

  count = var.cluster_type == "enhanced" ? 1 : 0
}
