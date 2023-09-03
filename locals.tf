# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl


locals {

  admin_region = lookup(local.regions, lower(lookup(var.admin_region, "region")))

  regions = {
    # Africa
    johannesburg = "af-johannesburg-1"

    # Asia
    chuncheon = "ap-chuncheon-1"
    hyderabad = "ap-hyderabad-1"
    mumbai    = "ap-mumbai-1"
    osaka     = "ap-osaka-1"
    seoul     = "ap-seoul-1"
    singapore = "ap-singapore-1"
    tokyo     = "ap-tokyo-1"

    # Europe
    amsterdam = "eu-amsterdam-1"
    frankfurt = "eu-frankfurt-1"
    london    = "uk-london-1"
    madrid    = "eu-madrid-1"
    marseille = "eu-marseille-1"
    milan     = "eu-milan-1"
    newport   = "uk-cardiff-1"
    paris     = "eu-paris-1"
    stockholm = "eu-stockholm-1"
    zurich    = "eu-zurich-1"

    # Middle East
    abudhabi  = "me-abudhabi-1"
    dubai     = "me-dubai-1"
    jeddah    = "me-jeddah-1"
    jerusalem = "il-jerusalem-1"

    # Oceania
    melbourne = "ap-melbourne-1"
    sydney    = "ap-sydney-1"


    # South America
    santiago = "sa-santiago-1"
    saupaulo = "sa-saupaulo-1"
    vinhedo  = "sa-vinhedo-1"

    # North America
    ashburn   = "us-ashburn-1"
    chicago   = "us-chicago-1"
    montreal  = "ca-montreal-1"
    phoenix   = "us-phoenix-1"
    queretaro = "mx-queretaro-1"
    sanjose   = "us-sanjose-1"
    toronto   = "ca-toronto-1"
  }

  all_clusters              = merge({ lookup(var.admin_region, "admin_name", "admin") = module.admin.cluster_id }, local.managed_clusters)
  managed_clusters          = { for k, v in module.clusters.cluster_ids : k => v if v != null }
  cluster_int_nsg_ids       = { for k, v in module.clusters.int_nsg_ids : k => v if v != null }
  cluster_int_lb_subnet_ids = { for k, v in module.clusters.int_lb_subnet_ids : k => v if v != null }
  cluster_pub_nsg_ids       = { for k, v in module.clusters.pub_nsg_ids : k => v if v != null }


  thanos_enhanced_template = "Allow any-user to manage objects in compartment id %s where all {request.principal.type='workload',request.principal.cluster_id='%s',request.principal.service_account='thanos-storegateway'}"

  thanos_policy_statement = var.cluster_type == "enhanced" ? tolist([
    for cluster in local.all_clusters :
    formatlist(local.thanos_enhanced_template, var.compartment_id, cluster)
  ]) : []
}
