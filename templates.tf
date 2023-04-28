# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

locals {

  kubeconfig_templates = {
    for c in keys(local.cluster_ids) :
    c => templatefile("${path.module}/scripts/generate_kubeconfig.template.sh",
      {
        cluster-id = lookup(local.cluster_ids, c)
        region     = c == "admin" ? local.admin_region : lookup(var.regions, c)
      }
    )
  }

  set_credentials_templates = {
    for c in keys(local.cluster_ids) :
    c => templatefile("${path.module}/scripts/kubeconfig_set_credentials.template.sh",
      {
        cluster-id    = lookup(local.cluster_ids, c)
        cluster-id-11 = substr(lookup(local.cluster_ids, c), (length(lookup(local.cluster_ids, c)) - 11), length(lookup(local.cluster_ids, c)))
        region        = c == "admin" ? local.admin_region : lookup(var.regions, c)
      }
    )
  }

  set_alias_templates = {
    for c in keys(local.cluster_ids) :
    c => templatefile("${path.module}/scripts/set_alias.template.sh",
      {
        cluster       = c
        cluster-id-11 = substr(lookup(local.cluster_ids, c), (length(lookup(local.cluster_ids, c)) - 11), length(lookup(local.cluster_ids, c)))
      }
    )
  }

  setup_vz_env_template = templatefile("${path.module}/scripts/setup_vz_env.template.sh", {})

  install_vz_operator_templates = {
    for k, v in local.cluster_ids :
    k => templatefile("${path.module}/scripts/install_vz_operator.template.sh",
      {
        cluster = k
        version = var.verrazzano_version
      }
    ) if v != "none"
  }

  check_vz_operator_templates = {
    for k, v in local.cluster_ids :
    k => templatefile("${path.module}/scripts/check_vz_operator.template.sh",
      {
        cluster = k
      }
    ) if v != "none"
  }

  get_oci_secret_template = templatefile("${path.module}/scripts/get_oci_secret.template.sh", {
    secret_id = var.secret_id
    }
  )

  create_oci_secret_templates = {
    for k, v in local.cluster_ids :
    k => templatefile("${path.module}/scripts/create_oci_secret.template.sh",
      {
        cluster = k
      }
    ) if v != "none"
  }

  install_admin_script = templatefile("${path.module}/scripts/install_vz_admin.template.sh", {})

  vz_admin_template = tobool(var.configure_dns) ? templatefile("${path.module}/resources/vz_admin.template.yaml", {
    compartment_id = var.dns_compartment_id
    dns_zone_id    = var.dns_zone_id
    dns_zone_name  = var.dns_zone_name
    profile        = var.verrazzano_profile
    public_nsg     = lookup(local.pub_nsg_ids, "admin")
    }
  ) : templatefile("${path.module}/resources/vz_admin_nip.template.yaml", {
    compartment_id = var.dns_compartment_id
    dns_zone_id    = var.dns_zone_id
    dns_zone_name  = var.dns_zone_name
    profile        = var.verrazzano_profile
    public_nsg     = lookup(local.pub_nsg_ids, "admin")
    }
  )

  all_clusters = {
    for k, v in local.cluster_ids :
    k => v if v != "none"
  }

  managed_clusters = {
    for k, v in local.cluster_ids :
    k => v if k != "admin" && v != "none"
  }

  install_managed_vz_templates = tobool(var.configure_dns) ? {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/resources/vz_mc.template.yaml",
      {
        cluster        = k
        compartment_id = var.dns_compartment_id
        dns_zone_id    = var.dns_zone_id
        dns_zone_name  = var.dns_zone_name
        public_nsg     = lookup(local.pub_nsg_ids, k)
        int_nsg        = lookup(local.int_nsg_ids, k)
      }
    ) if(var.install_vz == true)
    } : {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/resources/vz_mc_nip.template.yaml",
      {
        cluster        = k
        compartment_id = var.dns_compartment_id
        dns_zone_id    = var.dns_zone_id
        dns_zone_name  = var.dns_zone_name
        public_nsg     = lookup(local.pub_nsg_ids, k)
        int_nsg        = lookup(local.int_nsg_ids, k)
      }
    ) if(var.install_vz == true)
  }

  install_managed_vz_script = {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/scripts/install_vz_cluster.template.sh",
      {
        cluster = k
      }
    ) if(var.install_vz == true)
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
    ) if(var.install_vz == true)
  }

  api_cm_template = templatefile("${path.module}/resources/api_cm.template.yaml", {})

  create_api_cm_template = templatefile("${path.module}/scripts/create_api_cm.template.sh", {})

  vmc_template = templatefile("${path.module}/resources/vmc.template.yaml", {})

  create_vmc_script = {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/scripts/create_vmc.template.sh", {
      cluster = k
    }) if(var.install_vz == true)
  }

  register_vmc_templates = {
    for k, v in local.managed_clusters :
    k => templatefile("${path.module}/scripts/register_vmc.template.sh", {
      cluster = k
    }) if(var.install_vz == true)
  }
}
