# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

locals {

  kubeconfig_templates = {
    for c in keys(var.cluster_ids) :
    c => templatefile("${path.module}/scripts/generate_kubeconfig.template.sh",
      {
        cluster-id = lookup(var.cluster_ids, c)
        endpoint   = var.oke_control_plane == "public" ? "PUBLIC_ENDPOINT" : "PRIVATE_ENDPOINT"
        region     = c == "admin" ? local.admin_region : lookup(local.regions, c)
      }
    ) if(c != "admin")
  }

  set_credentials_templates = {
    for c in keys(var.cluster_ids) :
    c => templatefile("${path.module}/scripts/kubeconfig_set_credentials.template.sh",
      {
        cluster-id    = lookup(var.cluster_ids, c)
        cluster-id-11 = substr(lookup(var.cluster_ids, c), (length(lookup(var.cluster_ids, c)) - 11), length(lookup(var.cluster_ids, c)))
        region        = c == "admin" ? local.admin_region : lookup(local.regions, c)
      }
    ) if(c != "admin")
  }

  set_alias_templates = {
    for c in keys(var.cluster_ids) :
    c => templatefile("${path.module}/scripts/set_alias.template.sh",
      {
        cluster       = c
        cluster-id-11 = substr(lookup(var.cluster_ids, c), (length(lookup(var.cluster_ids, c)) - 11), length(lookup(var.cluster_ids, c)))
      }
    ) if(c != "admin")
  }

  setup_vz_env_template = templatefile("${path.module}/scripts/setup_vz_env.template.sh", {})

  install_vz_cli_template = templatefile(
    "${path.module}/scripts/install_vz_cli.template.sh", {
      version = var.verrazzano_version
    }
  )

  install_vz_operator_templates = {
    for k, v in var.cluster_ids :
    k => templatefile("${path.module}/scripts/install_vz_operator.template.sh",
      {
        cluster = k
        version = var.verrazzano_version
      }
    ) if v != ""
  }

  check_vz_operator_templates = {
    for k, v in var.cluster_ids :
    k => templatefile("${path.module}/scripts/check_vz_operator.template.sh",
      {
        cluster = k
      }
    ) if v != ""
  }

  get_oci_secret_template = templatefile("${path.module}/scripts/get_oci_secret.template.sh", {
    secret_id = var.secret_id
    }
  )

  create_oci_secret_templates = {
    for k, v in var.cluster_ids :
    k => templatefile("${path.module}/scripts/create_oci_secret.template.sh",
      {
        cluster = k
      }
    ) if v != ""
  }

  install_admin_script = templatefile("${path.module}/scripts/install_vz_admin.template.sh", {})

  vz_admin_template = tobool(var.configure_dns) ? templatefile("${path.module}/resources/vz_admin.template.yaml", {
    profile               = var.verrazzano_profile
    argocd                = var.argocd
    coherence             = var.coherence
    console               = var.console
    compartment_id        = var.dns_compartment_id
    dns_zone_id           = var.dns_zone_id
    dns_zone_name         = var.dns_zone_name
    fluentd               = var.fluentd
    grafana               = var.grafana
    control_plane         = var.verrazzano_control_plane == "public" ? false : true
    lb_shape              = lookup(var.verrazzano_load_balancer, "shape")
    flex_min              = lookup(var.verrazzano_load_balancer, "flex_min")
    flex_max              = lookup(var.verrazzano_load_balancer, "flex_max")
    control_plane_nsg     = var.verrazzano_control_plane == "public" ? lookup(var.pub_nsg_ids, "admin") : lookup(var.int_nsg_ids, "admin")
    mesh_id               = var.mesh_id
    cluster_name          = "admin"
    mesh_network          = "admin"
    data_plane            = var.verrazzano_data_plane == "public" ? false : true
    data_plane_nsg        = var.verrazzano_data_plane == "public" ? lookup(var.pub_nsg_ids, "admin") : lookup(var.int_nsg_ids, "admin")
    int-nsg-id            = lookup(var.int_nsg_ids, "admin")
    jaeger                = var.jaeger
    kiali                 = var.kiali
    kube_state_metrics    = var.kube_state_metrics
    opensearch            = var.opensearch
    opensearch_dashboards = var.opensearch_dashboards
    prometheus            = var.prometheus
    prometheus_operator   = var.prometheus_operator
    rancher               = var.rancher
    velero                = var.velero
    weblogic_operator     = var.weblogic_operator
    }
    ) : templatefile("${path.module}/resources/vz_admin_nip.template.yaml", {
      compartment_id    = var.dns_compartment_id
      dns_zone_id       = var.dns_zone_id
      dns_zone_name     = var.dns_zone_name
      profile           = var.verrazzano_profile
      control_plane     = var.verrazzano_control_plane == "public" ? false : true
      data_plane        = var.verrazzano_data_plane == "public" ? false : true
      control_plane_nsg = var.verrazzano_control_plane == "public" ? lookup(var.pub_nsg_ids, "admin") : lookup(var.int_nsg_ids, "admin")
      data_plane_nsg    = var.verrazzano_data_plane == "public" ? lookup(var.pub_nsg_ids, "admin") : lookup(var.int_nsg_ids, "admin")
      lb_shape          = lookup(var.verrazzano_load_balancer, "shape")
      flex_min          = lookup(var.verrazzano_load_balancer, "flex_min")
      flex_max          = lookup(var.verrazzano_load_balancer, "flex_max")
    }
  )

  all_clusters = {
    for k, v in var.cluster_ids :
    k => v if v != ""
  }

  managed_clusters = {
    for k, v in var.cluster_ids :
    k => v if k != "admin" && v != ""
  }

  install_managed_vz_templates = tobool(var.configure_dns) ? {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/resources/vz_mc.template.yaml",
      {
        cluster  = k 
        coherence             = var.coherence
        compartment_id        = var.dns_compartment_id
        dns_zone_id           = var.dns_zone_id
        dns_zone_name         = var.dns_zone_name
        fluentd               = var.fluentd
        control_plane         = var.verrazzano_control_plane == "public" ? false : true
        lb_shape              = lookup(var.verrazzano_load_balancer, "shape")
        flex_min              = lookup(var.verrazzano_load_balancer, "flex_min")
        flex_max              = lookup(var.verrazzano_load_balancer, "flex_max")
        control_plane_nsg     = var.verrazzano_control_plane == "public" ? lookup(var.pub_nsg_ids, "admin") : lookup(var.int_nsg_ids, "admin")
        mesh_id               = var.mesh_id
        cluster_name          = k
        mesh_network          = k
        data_plane            = var.verrazzano_data_plane == "public" ? false : true
        data_plane_nsg        = var.verrazzano_data_plane == "public" ? lookup(var.pub_nsg_ids, "admin") : lookup(var.int_nsg_ids, "admin")
        int-nsg-id            = lookup(var.int_nsg_ids, "admin")
        jaeger                = var.jaeger
        kiali                 = var.kiali
        kube_state_metrics    = var.kube_state_metrics
        prometheus            = var.prometheus
        prometheus_operator   = var.prometheus_operator
        velero                = var.velero
        weblogic_operator     = var.weblogic_operator
      }
    ) if tobool(var.install_verrazzano)
    } : {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/resources/vz_mc_nip.template.yaml",
      {
        cluster           = k
        compartment_id    = var.dns_compartment_id
        dns_zone_id       = var.dns_zone_id
        dns_zone_name     = var.dns_zone_name
        control_plane_nsg = var.verrazzano_control_plane == "public" ? lookup(var.pub_nsg_ids, k) : lookup(var.int_nsg_ids, k)
        data_plane_nsg    = var.verrazzano_data_plane == "public" ? lookup(var.pub_nsg_ids, k) : lookup(var.int_nsg_ids, k)
        control_plane     = var.verrazzano_control_plane == "public" ? false : true
        data_plane        = var.verrazzano_data_plane == "public" ? false : true
        lb_shape          = lookup(var.verrazzano_load_balancer, "shape")
        flex_min          = lookup(var.verrazzano_load_balancer, "flex_min")
        flex_max          = lookup(var.verrazzano_load_balancer, "flex_max")
      }
    ) if tobool(var.install_verrazzano)
  }

  install_managed_vz_script = {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/scripts/install_vz_cluster.template.sh",
      {
        cluster = k
      }
    )
  }

  managed_clusters_str = join(" ", keys(local.managed_clusters))

  check_vz_cluster_script = templatefile("${path.module}/scripts/check_vz_status.template.sh",
    {
      clusters = local.managed_clusters_str
    }
  )

  create_cert_script = {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/scripts/create_cert_secret.template.sh",
      {
        cluster = k
      }
    ) if tobool(var.install_verrazzano)
  }

  api_cm_template = templatefile("${path.module}/resources/api_cm.template.yaml", {})

  create_api_cm_template = templatefile("${path.module}/scripts/create_api_cm.template.sh", {})

  vmc_template = templatefile("${path.module}/resources/vmc.template.yaml", {})

  create_vmc_script = {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/scripts/create_vmc.template.sh", {
      cluster = k
    }) if tobool(var.install_verrazzano)
  }

  register_vmc_templates = {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/scripts/register_vmc.template.sh", {
      cluster = k
    }) if tobool(var.install_verrazzano)
  }

  vz_access_template = templatefile("${path.module}/scripts/get_vz_access.template.sh", {})
}
