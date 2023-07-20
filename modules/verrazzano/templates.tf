# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

locals {

  admin_region_name = lookup(var.admin_region, "admin_name", "admin")

  kubeconfig_templates = {
    for cluster_name, cluster_id in var.all_cluster_ids :
    cluster_name => templatefile("${path.module}/scripts/generate_kubeconfig.template.sh",
      {
        cluster_id = cluster_id
        endpoint   = var.oke_control_plane == "public" ? "PUBLIC_ENDPOINT" : "PRIVATE_ENDPOINT"
        region     = lookup(local.all_regions, cluster_name)
      }
    ) 
  }

  set_credentials_templates = {
    for cluster_name, cluster_id in var.all_cluster_ids :
    cluster_name => templatefile("${path.module}/scripts/kubeconfig_set_credentials.template.sh",
      {
        cluster_id = cluster_id
        cluster_id_11 = substr(cluster_id, (length(cluster_id) - 11), length(cluster_id))
        region        = lookup(local.all_regions, cluster_name)
      }
    )
  }

  set_alias_templates = {
    for cluster_name, cluster_id in var.all_cluster_ids :
    cluster_name => templatefile("${path.module}/scripts/set_alias.template.sh",
      {
        cluster       = cluster_name
        cluster_id_11 = substr(cluster_id, (length(cluster_id) - 11), length(cluster_id))
      }
    )
  }

  setup_vz_env_template = templatefile("${path.module}/scripts/setup_vz_env.template.sh", {})

  install_vz_cli_template = templatefile(
    "${path.module}/scripts/install_vz_cli.template.sh", {
      version = var.verrazzano_version
    }
  )

  install_vz_operator_templates = {
    for k, v in var.all_cluster_ids :
    k => templatefile("${path.module}/scripts/install_vz_operator.template.sh",
      {
        cluster = k
        version = var.verrazzano_version
      }
    ) if v != ""
  }

  check_vz_operator_templates = {
    for k, v in var.all_cluster_ids :
    k => templatefile("${path.module}/scripts/check_vz_operator.template.sh",
      {
        cluster = k
      }
    ) if v != ""
  }

  get_oci_secret_template = templatefile("${path.module}/scripts/get_oci_secret.template.sh", {
    dns_secret_id = var.dns_secret_id
    }
  )

  create_oci_secret_templates = {
    for k, v in var.all_cluster_ids :
    k => templatefile("${path.module}/scripts/create_oci_secret.template.sh",
      {
        cluster = k
      }
    ) if v != ""
  }

  install_admin_script = templatefile("${path.module}/scripts/install_vz_admin.template.sh", {
    admin_ctx = local.admin_region_name
  })

  vz_admin_template = tobool(var.configure_dns) ? templatefile("${path.module}/resources/vz_admin.template.yaml", {
    profile               = var.verrazzano_profile
    argocd                = var.argocd
    cluster               = local.admin_region_name
    cluster_api           = var.cluster_api
    coherence             = var.coherence
    console               = var.console
    compartment_id        = var.dns_compartment_id
    dns_zone_id           = var.dns_zone_id
    dns_zone_name         = var.dns_zone_name
    environment           = "${var.label_prefix}-${local.admin_region_name}"
    fluentd               = var.fluentd
    grafana               = var.grafana
    control_plane         = var.verrazzano_control_plane == "public" ? false : true
    lb_shape              = lookup(var.verrazzano_load_balancer, "shape")
    flex_min              = lookup(var.verrazzano_load_balancer, "flex_min")
    flex_max              = lookup(var.verrazzano_load_balancer, "flex_max")
    control_plane_nsg     = var.verrazzano_control_plane == "public" ? lookup(var.pub_nsg_ids, local.admin_region_name) : lookup(var.int_nsg_ids, local.admin_region_name)
    mesh_id               = var.mesh_id
    mesh_network          = local.admin_region_name
    data_plane            = var.verrazzano_data_plane == "public" ? false : true
    data_plane_nsg        = var.verrazzano_data_plane == "public" ? lookup(var.pub_nsg_ids, local.admin_region_name) : lookup(var.int_nsg_ids, local.admin_region_name)
    int_nsg_id            = lookup(var.int_nsg_ids, local.admin_region_name)
    int_lb_subnet_id      = lookup(var.int_lb_subnet_ids, local.admin_region_name)
    jaeger                = var.jaeger
    kiali                 = var.kiali
    kube_state_metrics    = var.kube_state_metrics
    opensearch            = var.opensearch
    opensearch_dashboards = var.opensearch_dashboards
    prometheus            = var.prometheus
    prometheus_operator   = var.prometheus_operator
    rancher               = var.rancher
    thanos_enabled        = tobool(lookup(var.thanos, "thanos_enabled", "false"))
    thanos_integration    = lookup(var.thanos, "integration", "sidecar")
    storage_gateway       = tobool(lookup(var.thanos, "storage_gateway", "false"))
    velero                = var.velero
    weblogic_operator     = var.weblogic_operator
    }
    ) : templatefile("${path.module}/resources/vz_admin_nip.template.yaml", {
      profile               = var.verrazzano_profile
      argocd                = var.argocd
      cluster               = local.admin_region_name
      cluster_api           = var.cluster_api      
      coherence             = var.coherence
      console               = var.console
      environment           = "${var.label_prefix}-${local.admin_region_name}"
      fluentd               = var.fluentd
      grafana               = var.grafana
      control_plane         = var.verrazzano_control_plane == "public" ? false : true
      control_plane_nsg     = var.verrazzano_control_plane == "public" ? lookup(var.pub_nsg_ids, local.admin_region_name) : lookup(var.int_nsg_ids, local.admin_region_name)
      data_plane            = var.verrazzano_data_plane == "public" ? false : true
      data_plane_nsg        = var.verrazzano_data_plane == "public" ? lookup(var.pub_nsg_ids, local.admin_region_name) : lookup(var.int_nsg_ids, local.admin_region_name)
      lb_shape              = lookup(var.verrazzano_load_balancer, "shape")
      flex_min              = lookup(var.verrazzano_load_balancer, "flex_min")
      flex_max              = lookup(var.verrazzano_load_balancer, "flex_max")
      int_nsg_id            = lookup(var.int_nsg_ids, local.admin_region_name)
      int_lb_subnet_id      = lookup(var.int_lb_subnet_ids, local.admin_region_name)
      jaeger                = var.jaeger
      kiali                 = var.kiali
      kube_state_metrics    = var.kube_state_metrics
      mesh_id               = var.mesh_id
      mesh_network          = local.admin_region_name
      opensearch            = var.opensearch
      opensearch_dashboards = var.opensearch_dashboards
      prometheus            = var.prometheus
      prometheus_operator   = var.prometheus_operator
      thanos_enabled        = tobool(lookup(var.thanos, "thanos_enabled", "false"))
      thanos_integration    = lookup(var.thanos, "integration", "sidecar")
      storage_gateway       = tobool(lookup(var.thanos, "storage_gateway", "false"))
      rancher               = var.rancher
      velero                = var.velero
      weblogic_operator     = var.weblogic_operator
    }
  )

  install_managed_vz_templates = tobool(var.configure_dns) ? {
    for k, v in var.managed_cluster_ids :
    k => templatefile("${path.module}/resources/vz_mc.template.yaml",
      {
        cluster             = k
        coherence           = var.coherence
        compartment_id      = var.dns_compartment_id
        dns_zone_id         = var.dns_zone_id
        dns_zone_name       = var.dns_zone_name
        fluentd             = var.fluentd
        control_plane       = var.verrazzano_control_plane == "public" ? false : true
        control_plane_nsg   = var.verrazzano_control_plane == "public" ? lookup(var.pub_nsg_ids, k) : lookup(var.int_nsg_ids, k)
        data_plane          = var.verrazzano_data_plane == "public" ? false : true
        data_plane_nsg      = var.verrazzano_data_plane == "public" ? lookup(var.pub_nsg_ids, k) : lookup(var.int_nsg_ids, k)
        lb_shape            = lookup(var.verrazzano_load_balancer, "shape")
        flex_min            = lookup(var.verrazzano_load_balancer, "flex_min")
        flex_max            = lookup(var.verrazzano_load_balancer, "flex_max")
        int_nsg_id          = lookup(var.int_nsg_ids, k,"")
        int_lb_subnet_id    = lookup(var.int_lb_subnet_ids, k,"")
        jaeger              = var.jaeger
        kiali               = var.kiali
        kube_state_metrics  = var.kube_state_metrics
        mesh_id             = var.mesh_id
        mesh_network        = k
        prometheus          = var.prometheus
        prometheus_operator = var.prometheus_operator
        thanos_enabled      = tobool(lookup(var.thanos, "thanos_enabled", "false"))
        thanos_integration  = lookup(var.thanos, "integration", "sidecar")
        storage_gateway     = tobool(lookup(var.thanos, "storage_gateway", "false"))
        velero              = var.velero
        weblogic_operator   = var.weblogic_operator
      }
    ) if(var.install_verrazzano == true)
    } : {
    for k, v in var.managed_cluster_ids :
    k => templatefile("${path.module}/resources/vz_mc_nip.template.yaml",
      {
        cluster             = k
        coherence           = var.coherence
        fluentd             = var.fluentd
        control_plane       = var.verrazzano_control_plane == "public" ? false : true
        control_plane_nsg   = var.verrazzano_control_plane == "public" ? lookup(var.pub_nsg_ids, k) : lookup(var.int_nsg_ids, k)
        data_plane          = var.verrazzano_data_plane == "public" ? false : true
        data_plane_nsg      = var.verrazzano_data_plane == "public" ? lookup(var.pub_nsg_ids, k) : lookup(var.int_nsg_ids, k)
        lb_shape            = lookup(var.verrazzano_load_balancer, "shape")
        flex_min            = lookup(var.verrazzano_load_balancer, "flex_min")
        flex_max            = lookup(var.verrazzano_load_balancer, "flex_max")
        int_nsg_id          = lookup(var.int_nsg_ids, k)
        int_lb_subnet_id    = lookup(var.int_lb_subnet_ids, k)
        jaeger              = var.jaeger
        kiali               = var.kiali
        kube_state_metrics  = var.kube_state_metrics
        mesh_id             = var.mesh_id
        mesh_network        = k
        prometheus          = var.prometheus
        prometheus_operator = var.prometheus_operator
        velero              = var.velero
        weblogic_operator   = var.weblogic_operator
      }
    ) if(var.install_verrazzano == true)
  }

  install_managed_vz_script = {
    for k, v in var.managed_cluster_ids :
    k => templatefile("${path.module}/scripts/install_vz_cluster.template.sh",
      {
        cluster = k
      }
    )
  }

  managed_clusters_str = join(" ", keys(var.managed_cluster_ids))

  check_vz_cluster_script = templatefile("${path.module}/scripts/check_vz_status.template.sh",
    {
      clusters = local.managed_clusters_str
    }
  )

  create_cert_script = {
    for k, v in var.managed_cluster_ids :
    k => templatefile("${path.module}/scripts/create_cert_secret.template.sh",
      {
        cluster   = k
        admin_ctx = local.admin_region_name
      }
    ) if tobool(var.install_verrazzano)
  }

  api_cm_template = templatefile("${path.module}/resources/api_cm.template.yaml", {
    admin_ctx = local.admin_region_name
  })

  create_api_cm_template = templatefile("${path.module}/scripts/create_api_cm.template.sh", {
    admin_ctx = local.admin_region_name
  })

  vmc_template = templatefile("${path.module}/resources/vmc.template.yaml", {})

  create_vmc_script = {
    for k, v in var.managed_cluster_ids :
    k => templatefile("${path.module}/scripts/create_vmc.template.sh", {
      admin_ctx = local.admin_region_name
      cluster   = k
    }) if tobool(var.install_verrazzano)
  }

  register_vmc_templates = {
    for k, v in var.managed_cluster_ids :
    k => templatefile("${path.module}/scripts/register_vmc.template.sh", {
      admin_ctx = local.admin_region_name
      cluster   = k
    }) if tobool(var.install_verrazzano)
  }

  thanos_storage_templates = {
    for k, v in var.all_cluster_ids :
    k => templatefile("${path.module}/resources/thanos-storage.template.yaml", {
      region      = lookup(local.all_regions, k)
      bucket_name = lookup(var.thanos, "bucket_name", "thanos")
    }) if tobool(lookup(var.thanos, "enabled", "false")) && v != ""
  }

  token_helper_template = templatefile("${path.module}/scripts/token_helper.template.sh", {})

  vz_access_template = templatefile("${path.module}/scripts/get_vz_access.template.sh", {})
}
