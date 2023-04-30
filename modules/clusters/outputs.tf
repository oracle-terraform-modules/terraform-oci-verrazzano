# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "cluster_ids" {
  value = {
    "johannesburg" = join(",", module.johannesburg[*].cluster_id)
    "chuncheon"    = join(",", module.chuncheon[*].cluster_id)
    "hyderabad"    = join(",", module.hyderabad[*].cluster_id)
    "mumbai"       = join(",", module.mumbai[*].cluster_id)
    "osaka"        = join(",", module.osaka[*].cluster_id)
    "seoul"        = join(",", module.seoul[*].cluster_id)
    "singapore"    = join(",", module.singapore[*].cluster_id)
    "tokyo"        = join(",", module.tokyo[*].cluster_id)
    "amsterdam"    = join(",", module.amsterdam[*].cluster_id)
    "frankfurt"    = join(",", module.frankfurt[*].cluster_id)
    "london"       = join(",", module.london[*].cluster_id)
    "madrid"       = join(",", module.madrid[*].cluster_id)
    "marseille"    = join(",", module.marseille[*].cluster_id)
    "milan"        = join(",", module.milan[*].cluster_id)
    "newport"      = join(",", module.newport[*].cluster_id)
    "paris"        = join(",", module.paris[*].cluster_id)
    "stockholm"    = join(",", module.stockholm[*].cluster_id)
    "zurich"       = join(",", module.zurich[*].cluster_id)
    "abudhabi"     = join(",", module.abudhabi[*].cluster_id)
    "dubai"        = join(",", module.dubai[*].cluster_id)
    "jeddah"       = join(",", module.jeddah[*].cluster_id)
    "jerusalem"    = join(",", module.jerusalem[*].cluster_id)
    "melbourne"    = join(",", module.melbourne[*].cluster_id)
    "sydney"       = join(",", module.sydney[*].cluster_id)
    "santiago"     = join(",", module.santiago[*].cluster_id)
    "saupaulo"     = join(",", module.saupaulo[*].cluster_id)
    "vinhedo"      = join(",", module.vinhedo[*].cluster_id)
    "ashburn"      = join(",", module.ashburn[*].cluster_id)
    "chicago"      = join(",", module.chicago[*].cluster_id)
    "montreal"     = join(",", module.montreal[*].cluster_id)
    "phoenix"      = join(",", module.phoenix[*].cluster_id)
    "queretaro"    = join(",", module.queretaro[*].cluster_id)
    "sanjose"      = join(",", module.sanjose[*].cluster_id)
    "toronto"      = join(",", module.toronto[*].cluster_id)
  }
}

output "int_nsg_ids" {
  value = {
    "johannesburg" = join(",", module.johannesburg[*].int_lb_nsg)
    "chuncheon"    = join(",", module.chuncheon[*].int_lb_nsg)
    "hyderabad"    = join(",", module.hyderabad[*].int_lb_nsg)
    "mumbai"       = join(",", module.mumbai[*].int_lb_nsg)
    "osaka"        = join(",", module.osaka[*].int_lb_nsg)
    "seoul"        = join(",", module.seoul[*].int_lb_nsg)
    "singapore"    = join(",", module.singapore[*].int_lb_nsg)
    "tokyo"        = join(",", module.tokyo[*].int_lb_nsg)
    "amsterdam"    = join(",", module.amsterdam[*].int_lb_nsg)
    "frankfurt"    = join(",", module.frankfurt[*].int_lb_nsg)
    "london"       = join(",", module.london[*].int_lb_nsg)
    "madrid"       = join(",", module.madrid[*].int_lb_nsg)
    "marseille"    = join(",", module.marseille[*].int_lb_nsg)
    "milan"        = join(",", module.milan[*].int_lb_nsg)
    "newport"      = join(",", module.newport[*].int_lb_nsg)
    "paris"        = join(",", module.paris[*].int_lb_nsg)
    "stockholm"    = join(",", module.stockholm[*].int_lb_nsg)
    "zurich"       = join(",", module.zurich[*].int_lb_nsg)
    "abudhabi"     = join(",", module.abudhabi[*].int_lb_nsg)
    "dubai"        = join(",", module.dubai[*].int_lb_nsg)
    "jeddah"       = join(",", module.jeddah[*].int_lb_nsg)
    "jerusalem"    = join(",", module.jerusalem[*].int_lb_nsg)
    "melbourne"    = join(",", module.melbourne[*].int_lb_nsg)
    "sydney"       = join(",", module.sydney[*].int_lb_nsg)
    "santiago"     = join(",", module.santiago[*].int_lb_nsg)
    "saupaulo"     = join(",", module.saupaulo[*].int_lb_nsg)
    "vinhedo"      = join(",", module.vinhedo[*].int_lb_nsg)
    "ashburn"      = join(",", module.ashburn[*].int_lb_nsg)
    "chicago"      = join(",", module.chicago[*].int_lb_nsg)
    "montreal"     = join(",", module.montreal[*].int_lb_nsg)
    "phoenix"      = join(",", module.phoenix[*].int_lb_nsg)
    "queretaro"    = join(",", module.queretaro[*].int_lb_nsg)
    "sanjose"      = join(",", module.sanjose[*].int_lb_nsg)
    "toronto"      = join(",", module.toronto[*].int_lb_nsg)       
  }
}

output "pub_nsg_ids" {
  value = {
    "johannesburg" = join(",", module.johannesburg[*].pub_lb_nsg)
    "chuncheon"    = join(",", module.chuncheon[*].pub_lb_nsg)
    "hyderabad"    = join(",", module.hyderabad[*].pub_lb_nsg)
    "mumbai"       = join(",", module.mumbai[*].pub_lb_nsg)
    "osaka"        = join(",", module.osaka[*].pub_lb_nsg)
    "seoul"        = join(",", module.seoul[*].pub_lb_nsg)
    "singapore"    = join(",", module.singapore[*].pub_lb_nsg)
    "tokyo"        = join(",", module.tokyo[*].pub_lb_nsg)
    "amsterdam"    = join(",", module.amsterdam[*].pub_lb_nsg)
    "frankfurt"    = join(",", module.frankfurt[*].pub_lb_nsg)
    "london"       = join(",", module.london[*].pub_lb_nsg)
    "madrid"       = join(",", module.madrid[*].pub_lb_nsg)
    "marseille"    = join(",", module.marseille[*].pub_lb_nsg)
    "milan"        = join(",", module.milan[*].pub_lb_nsg)
    "newport"      = join(",", module.newport[*].pub_lb_nsg)
    "paris"        = join(",", module.paris[*].pub_lb_nsg)
    "stockholm"    = join(",", module.stockholm[*].pub_lb_nsg)
    "zurich"       = join(",", module.zurich[*].pub_lb_nsg)
    "abudhabi"     = join(",", module.abudhabi[*].pub_lb_nsg)
    "dubai"        = join(",", module.dubai[*].pub_lb_nsg)
    "jeddah"       = join(",", module.jeddah[*].pub_lb_nsg)
    "jerusalem"    = join(",", module.jerusalem[*].pub_lb_nsg)
    "melbourne"    = join(",", module.melbourne[*].pub_lb_nsg)
    "sydney"       = join(",", module.sydney[*].pub_lb_nsg)
    "santiago"     = join(",", module.santiago[*].pub_lb_nsg)
    "saupaulo"     = join(",", module.saupaulo[*].pub_lb_nsg)
    "vinhedo"      = join(",", module.vinhedo[*].pub_lb_nsg)
    "ashburn"      = join(",", module.ashburn[*].pub_lb_nsg)
    "chicago"      = join(",", module.chicago[*].pub_lb_nsg)
    "montreal"     = join(",", module.montreal[*].pub_lb_nsg)
    "phoenix"      = join(",", module.phoenix[*].pub_lb_nsg)
    "queretaro"    = join(",", module.queretaro[*].pub_lb_nsg)
    "sanjose"      = join(",", module.sanjose[*].pub_lb_nsg)
    "toronto"      = join(",", module.toronto[*].pub_lb_nsg)       
  }
}
