# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      # pass oci home region provider explicitly for identity operations
      configuration_aliases = [oci.home, oci.johannesburg, oci.chuncheon, oci.hyderabad, oci.mumbai, oci.osaka,
        oci.seoul, oci.singapore, oci.tokyo, oci.amsterdam, oci.frankfurt, oci.london,
        oci.madrid, oci.marseille, oci.milan, oci.newport, oci.paris, oci.stockholm,
        oci.zurich, oci.abudhabi, oci.dubai, oci.jeddah, oci.jerusalem, oci.melbourne,
        oci.sydney, oci.santiago, oci.saupaulo, oci.vinhedo, oci.ashburn, oci.chicago,
        oci.montreal, oci.phoenix, oci.queretaro, oci.sanjose, oci.toronto
      ]
      version = ">= 4.67.3"
    }
  }
  required_version = ">= 1.0.0"
}

locals {
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

  cidrs = {
    # Africa
    johannesburg = { vcn = "10.1.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }

    # Asia
    chuncheon = { vcn = "10.2.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    hyderabad = { vcn = "10.3.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    mumbai    = { vcn = "10.4.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    osaka     = { vcn = "10.5.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    seoul     = { vcn = "10.6.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    singapore = { vcn = "10.7.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    tokyo     = { vcn = "10.8.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }

    # Europe
    amsterdam = { vcn = "10.9.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    frankfurt = { vcn = "10.10.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    london    = { vcn = "10.11.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    madrid    = { vcn = "10.12.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    marseille = { vcn = "10.13.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    milan     = { vcn = "10.14.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    newport   = { vcn = "10.15.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    paris     = { vcn = "10.16.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    stockholm = { vcn = "10.17.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    zurich    = { vcn = "10.18.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }

    # Middle East
    abudhabi  = { vcn = "10.19.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    dubai     = { vcn = "10.20.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    jeddah    = { vcn = "10.21.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    jerusalem = { vcn = "10.22.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }

    # Oceania
    melbourne = { vcn = "10.23.0.0/16", pods = "10.223.0.0/16", services = "10.123.0.0/16" }
    sydney    = { vcn = "10.24.0.0/16", pods = "10.224.0.0/16", services = "10.124.0.0/16" }

    # South America
    santiago = { vcn = "10.25.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    saupaulo = { vcn = "10.26.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    vinhedo  = { vcn = "10.27.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }

    # North America
    ashburn   = { vcn = "10.28.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    chicago   = { vcn = "10.29.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    montreal  = { vcn = "10.30.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    phoenix   = { vcn = "10.31.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    queretaro = { vcn = "10.32.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    sanjose   = { vcn = "10.33.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
    toronto   = { vcn = "10.34.0.0/16", pods = "10.244.0.0/16", services = "10.96.0.0/16" }
  }

  managed_nodepools = var.nodepools
}
