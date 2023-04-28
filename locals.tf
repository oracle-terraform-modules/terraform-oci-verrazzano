# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl


locals {

  admin_region = lookup(local.regions,lower(lookup(var.admin_region, "region")))

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

  cluster_ids = {
    admin = module.admin.cluster_id
    # johannesburg = var.clusters["johannesburg"] == true ? module.johannesburg[0].cluster_id : "none"
    # chuncheon    = var.clusters["chuncheon"] == true ? module.chuncheon[0].cluster_id : "none"
    # hyderabad    = var.clusters["hyderabad"] == true ? module.hyderabad[0].cluster_id : "none"
    # mumbai       = var.clusters["mumbai"] == true ? module.mumbai[0].cluster_id : "none"
    # osaka = var.clusters["osaka"] == true ? module.osaka[0].cluster_id : "none"
    # seoul        = var.clusters["seoul"] == true ? module.seoul[0].cluster_id : "none"
    # singapore    = var.clusters["singapore"] == true ? module.singapore[0].cluster_id : "none"
    # tokyo = var.clusters["tokyo"] == true ? module.tokyo[0].cluster_id : "none"
    # amsterdam    = var.clusters["amsterdam"] == true ? module.amsterdam[0].cluster_id : "none"
    # frankfurt    = var.clusters["frankfurt"] == true ? module.frankfurt[0].cluster_id : "none"
    # london       = var.clusters["london"] == true ? module.london[0].cluster_id : "none"
    # madrid       = var.clusters["madrid"] == true ? module.madrid[0].cluster_id : "none"
    # marseille    = var.clusters["marseille"] == true ? module.marseille[0].cluster_id : "none"
    # milan        = var.clusters["milan"] == true ? module.milan[0].cluster_id : "none"
    # newport      = var.clusters["newport"] == true ? module.newport[0].cluster_id : "none"
    # paris        = var.clusters["paris"] == true ? module.paris[0].cluster_id : "none"
    # stockholm    = var.clusters["stockholm"] == true ? module.stockholm[0].cluster_id : "none"
    # zurich       = var.clusters["zurich"] == true ? module.zurich[0].cluster_id : "none"
    # abudhabi     = var.clusters["abudhabi"] == true ? module.abudhabi[0].cluster_id : "none"
    # dubai        = var.clusters["dubai"] == true ? module.dubai[0].cluster_id : "none"
    # jeddah       = var.clusters["jeddah"] == true ? module.jeddah[0].cluster_id : "none"
    # jerusalem    = var.clusters["jerusalem"] == true ? module.jerusalem[0].cluster_id : "none"
    # melbourne = var.clusters["melbourne"] == true ? module.melbourne[0].cluster_id : "none"
    # sydney    = var.clusters["sydney"] == true ? module.sydney[0].cluster_id : "none"
    # santiago     = var.clusters["santiago"] == true ? module.santiago[0].cluster_id : "none"
    # saupaulo     = var.clusters["saupaulo"] == true ? module.saupaulo[0].cluster_id : "none"
    # vinhedo      = var.clusters["vinhedo"] == true ? module.vinhedo[0].cluster_id : "none"
    # ashburn      = var.clusters["ashburn"] == true ? module.ashburn[0].cluster_id : "none"
    # chicago      = var.clusters["chicago"] == true ? module.chicago[0].cluster_id : "none"
    # montreal     = var.clusters["montreal"] == true ? module.montreal[0].cluster_id : "none"
    # phoenix      = var.clusters["phoenix"] == true ? module.phoenix[0].cluster_id : "none"
    # queretaro    = var.clusters["queretaro"] == true ? module.queretaro[0].cluster_id : "none"
    # sanjose      = var.clusters["sanjose"] == true ? module.sanjose[0].cluster_id : "none"
    # toronto      = var.clusters["toronto"] == true ? module.toronto[0].cluster_id : "none"

  }

  int_nsg_ids = {
    admin = lookup(module.admin.nsg_ids, "int_lb")
    # johannesburg = var.clusters["johannesburg"] == true ? lookup(module.johannesburg[0].nsg_ids, "int_lb") : "none"
    # chuncheon    = var.clusters["chuncheon"] == true ? lookup(module.chuncheon[0].nsg_ids, "int_lb") : "none"
    # hyderabad    = var.clusters["hyderabad"] == true ? lookup(module.hyderabad[0].nsg_ids, "int_lb") : "none"
    # mumbai       = var.clusters["mumbai"] == true ? lookup(module.mumbai[0].nsg_ids, "int_lb") : "none"
    # osaka = var.clusters["osaka"] == true ? lookup(module.osaka[0].nsg_ids, "int_lb") : "none"
    # seoul        = var.clusters["seoul"] == true ? lookup(module.seoul[0].nsg_ids, "int_lb") : "none"
    # singapore    = var.clusters["singapore"] == true ? lookup(module.singapore[0].nsg_ids, "int_lb") : "none"
    # tokyo = var.clusters["tokyo"] == true ? lookup(module.tokyo[0].nsg_ids, "int_lb") : "none"
    # amsterdam    = var.clusters["amsterdam"] == true ? lookup(module.amsterdam[0].nsg_ids, "int_lb") : "none"
    # frankfurt    = var.clusters["frankfurt"] == true ? lookup(module.frankfurt[0].nsg_ids, "int_lb") : "none"
    # london       = var.clusters["london"] == true ? lookup(module.london[0].nsg_ids, "int_lb") : "none"
    # madrid       = var.clusters["madrid"] == true ? lookup(module.madrid[0].nsg_ids, "int_lb") : "none"
    # marseille    = var.clusters["marseille"] == true ? lookup(module.marseille[0].nsg_ids, "int_lb") : "none"
    # milan        = var.clusters["milan"] == true ? lookup(module.milan[0].nsg_ids, "int_lb") : "none"
    # newport      = var.clusters["newport"] == true ? lookup(module.newport[0].nsg_ids, "int_lb") : "none"
    # paris        = var.clusters["paris"] == true ? lookup(module.paris[0].nsg_ids, "int_lb") : "none"
    # stockholm    = var.clusters["stockholm"] == true ? lookup(module.stockholm[0].nsg_ids, "int_lb") : "none"
    # zurich       = var.clusters["zurich"] == true ? lookup(module.zurich[0].nsg_ids, "int_lb") : "none"
    # abudhabi     = var.clusters["abudhabi"] == true ? lookup(module.abudhabi[0].nsg_ids, "int_lb") : "none"
    # dubai        = var.clusters["dubai"] == true ? lookup(module.dubai[0].nsg_ids, "int_lb") : "none"
    # jeddah       = var.clusters["jeddah"] == true ? lookup(module.jeddah[0].nsg_ids, "int_lb") : "none"
    # jerusalem    = var.clusters["jerusalem"] == true ? lookup(module.jerusalem[0].nsg_ids, "int_lb") : "none"
    # melbourne = var.clusters["melbourne"] == true ? lookup(module.melbourne[0].nsg_ids, "int_lb") : "none"
    # sydney    = var.clusters["sydney"] == true ? lookup(module.sydney[0].nsg_ids, "int_lb") : "none"
    # santiago     = var.clusters["santiago"] == true ? lookup(module.santiago[0].nsg_ids, "int_lb") : "none"
    # saupaulo     = var.clusters["saupaulo"] == true ? lookup(module.saupaulo[0].nsg_ids, "int_lb") : "none"
    # vinhedo      = var.clusters["vinhedo"] == true ? lookup(module.vinhedo[0].nsg_ids, "int_lb") : "none"
    # ashburn      = var.clusters["ashburn"] == true ? lookup(module.ashburn[0].nsg_ids, "int_lb") : "none"
    # chicago      = var.clusters["chicago"] == true ? lookup(module.chicago[0].nsg_ids, "int_lb") : "none"
    # montreal     = var.clusters["montreal"] == true ? lookup(module.montreal[0].nsg_ids, "int_lb") : "none"
    # phoenix      = var.clusters["phoenix"] == true ? lookup(module.phoenix[0].nsg_ids, "int_lb") : "none"
    # queretaro    = var.clusters["queretaro"] == true ? lookup(module.queretaro[0].nsg_ids, "int_lb") : "none"
    # sanjose      = var.clusters["sanjose"] == true ? lookup(module.sanjose[0].nsg_ids, "int_lb") : "none"
    # toronto      = var.clusters["toronto"] == true ? lookup(module.toronto[0].nsg_ids, "int_lb") : "none"
  }

  pub_nsg_ids = {
    admin = lookup(module.admin.nsg_ids, "pub_lb")
    # johannesburg = var.clusters["johannesburg"] == true ? lookup(module.johannesburg[0].nsg_ids, "pub_lb") : "none"
    # chuncheon    = var.clusters["chuncheon"] == true ? lookup(module.chuncheon[0].nsg_ids, "pub_lb") : "none"
    # hyderabad    = var.clusters["hyderabad"] == true ? lookup(module.hyderabad[0].nsg_ids, "pub_lb") : "none"
    # mumbai       = var.clusters["mumbai"] == true ? lookup(module.mumbai[0].nsg_ids, "pub_lb") : "none"
    # osaka = var.clusters["osaka"] == true ? lookup(module.osaka[0].nsg_ids, "pub_lb") : "none"
    # seoul        = var.clusters["seoul"] == true ? lookup(module.seoul[0].nsg_ids, "pub_lb") : "none"
    # singapore    = var.clusters["singapore"] == true ? lookup(module.singapore[0].nsg_ids, "pub_lb") : "none"
    # tokyo = var.clusters["tokyo"] == true ? lookup(module.tokyo[0].nsg_ids, "pub_lb") : "none"
    # amsterdam    = var.clusters["amsterdam"] == true ? lookup(module.amsterdam[0].nsg_ids, "pub_lb") : "none"
    # frankfurt    = var.clusters["frankfurt"] == true ? lookup(module.frankfurt[0].nsg_ids, "pub_lb") : "none"
    # london       = var.clusters["london"] == true ? lookup(module.london[0].nsg_ids, "pub_lb") : "none"
    # madrid       = var.clusters["madrid"] == true ? lookup(module.madrid[0].nsg_ids, "pub_lb") : "none"
    # marseille    = var.clusters["marseille"] == true ? lookup(module.marseille[0].nsg_ids, "pub_lb") : "none"
    # milan        = var.clusters["milan"] == true ? lookup(module.milan[0].nsg_ids, "pub_lb") : "none"
    # newport      = var.clusters["newport"] == true ? lookup(module.newport[0].nsg_ids, "pub_lb") : "none"
    # paris        = var.clusters["paris"] == true ? lookup(module.paris[0].nsg_ids, "pub_lb") : "none"
    # stockholm    = var.clusters["stockholm"] == true ? lookup(module.stockholm[0].nsg_ids, "pub_lb") : "none"
    # zurich       = var.clusters["zurich"] == true ? lookup(module.zurich[0].nsg_ids, "pub_lb") : "none"
    # abudhabi     = var.clusters["abudhabi"] == true ? lookup(module.abudhabi[0].nsg_ids, "pub_lb") : "none"
    # dubai        = var.clusters["dubai"] == true ? lookup(module.dubai[0].nsg_ids, "pub_lb") : "none"
    # jeddah       = var.clusters["jeddah"] == true ? lookup(module.jeddah[0].nsg_ids, "pub_lb") : "none"
    # jerusalem    = var.clusters["jerusalem"] == true ? lookup(module.jerusalem[0].nsg_ids, "pub_lb") : "none"
    # melbourne = var.clusters["melbourne"] == true ? lookup(module.melbourne[0].nsg_ids, "pub_lb") : "none"
    # sydney    = var.clusters["sydney"] == true ? lookup(module.sydney[0].nsg_ids, "pub_lb") : "none"
    # santiago     = var.clusters["santiago"] == true ? lookup(module.santiago[0].nsg_ids, "pub_lb") : "none"
    # saupaulo     = var.clusters["saupaulo"] == true ? lookup(module.saupaulo[0].nsg_ids, "pub_lb") : "none"
    # vinhedo      = var.clusters["vinhedo"] == true ? lookup(module.vinhedo[0].nsg_ids, "pub_lb") : "none"
    # ashburn      = var.clusters["ashburn"] == true ? lookup(module.ashburn[0].nsg_ids, "pub_lb") : "none"
    # chicago      = var.clusters["chicago"] == true ? lookup(module.chicago[0].nsg_ids, "pub_lb") : "none"
    # montreal     = var.clusters["montreal"] == true ? lookup(module.montreal[0].nsg_ids, "pub_lb") : "none"
    # phoenix      = var.clusters["phoenix"] == true ? lookup(module.phoenix[0].nsg_ids, "pub_lb") : "none"
    # queretaro    = var.clusters["queretaro"] == true ? lookup(module.queretaro[0].nsg_ids, "pub_lb") : "none"
    # sanjose      = var.clusters["sanjose"] == true ? lookup(module.sanjose[0].nsg_ids, "pub_lb") : "none"
    # toronto      = var.clusters["toronto"] == true ? lookup(module.toronto[0].nsg_ids, "pub_lb") : "none"

  }

    managed_nodepools = {
    np1 = {
      shape            = "VM.Standard.E4.Flex",
      ocpus            = 2,
      memory           = 32,
      node_pool_size   = 2,
      boot_volume_size = 150,
    }
  }
}
