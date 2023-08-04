# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "cluster_ids" {
  value = {
    # "johannesburg" = one(element([module.johannesburg[*].cluster_id],0))
    # "chuncheon"    = one(element([module.chuncheon[*].cluster_id],0))
    # "hyderabad"    = one(element([module.hyderabad[*].cluster_id],0))
    # "mumbai"       = one(element([module.mumbai[*].cluster_id],0))
    # "osaka"        = one(element([module.osaka[*].cluster_id],0))
    # "seoul"        = one(element([module.seoul[*].cluster_id],0))
    # "singapore"    = one(element([module.singapore[*].cluster_id],0))
    # "tokyo"        = one(element([module.tokyo[*].cluster_id],0))
    # "amsterdam"    = one(element([module.amsterdam[*].cluster_id],0))
    # "frankfurt"    = one(element([module.frankfurt[*].cluster_id],0))
    # "london"       = one(element([module.london[*].cluster_id],0))
    # "madrid"       = one(element([module.madrid[*].cluster_id],0))
    # "marseille"    = one(element([module.marseille[*].cluster_id],0))
    # "milan"        = one(element([module.milan[*].cluster_id],0))
    # "newport"      = one(element([module.newport[*].cluster_id],0))
    # "paris"        = one(element([module.paris[*].cluster_id],0))
    # "stockholm"    = one(element([module.stockholm[*].cluster_id],0))
    # "zurich"       = one(element([module.zurich[*].cluster_id],0))
    # "abudhabi"     = one(element([module.abudhabi[*].cluster_id],0))
    # "dubai"        = one(element([module.dubai[*].cluster_id],0))
    # "jeddah"       = one(element([module.jeddah[*].cluster_id],0))
    # "jerusalem"    = one(element([module.jerusalem[*].cluster_id],0))
    # "melbourne"    = one(element([module.melbourne[*].cluster_id],0))
    # "sydney"       = one(element([module.sydney[*].cluster_id],0))
    # "santiago"     = one(element([module.santiago[*].cluster_id],0))
    # "saupaulo"     = one(element([module.saupaulo[*].cluster_id],0))
    # "vinhedo"      = one(element([module.vinhedo[*].cluster_id],0))
    # "ashburn"      = one(element([module.ashburn[*].cluster_id],0))
    # "chicago"      = one(element([module.chicago[*].cluster_id],0))
    # "montreal"     = one(element([module.montreal[*].cluster_id],0))
    # "phoenix"      = one(element([module.phoenix[*].cluster_id],0))
    # "queretaro"    = one(element([module.queretaro[*].cluster_id],0))
    # "sanjose"      = one(element([module.sanjose[*].cluster_id],0))
    # "toronto"      = one(element([module.toronto[*].cluster_id],0))
  }
}

output "int_nsg_ids" {
  value = {
    # "johannesburg" = one(element([module.johannesburg[*].int_lb_nsg_id],0))
    # "chuncheon"    = one(element([module.chuncheon[*].int_lb_nsg_id],0))
    # "hyderabad"    = one(element([module.hyderabad[*].int_lb_nsg_id],0))
    # "mumbai"       = one(element([module.mumbai[*].int_lb_nsg_id],0))
    # "osaka"        = one(element([module.osaka[*].int_lb_nsg_id],0))
    # "seoul"        = one(element([module.seoul[*].int_lb_nsg_id],0))
    # "singapore"    = one(element([module.singapore[*].int_lb_nsg_id],0))
    # "tokyo"        = one(element([module.tokyo[*].int_lb_nsg_id],0))
    # "amsterdam"    = one(element([module.amsterdam[*].int_lb_nsg_id],0))
    # "frankfurt"    = one(element([module.frankfurt[*].int_lb_nsg_id],0))
    # "london"       = one(element([module.london[*].int_lb_nsg_id],0))
    # "madrid"       = one(element([module.madrid[*].int_lb_nsg_id],0))
    # "marseille"    = one(element([module.marseille[*].int_lb_nsg_id],0))
    # "milan"        = one(element([module.milan[*].int_lb_nsg_id],0))
    # "newport"      = one(element([module.newport[*].int_lb_nsg_id],0))
    # "paris"        = one(element([module.paris[*].int_lb_nsg_id],0))
    # "stockholm"    = one(element([module.stockholm[*].int_lb_nsg_id],0))
    # "zurich"       = one(element([module.zurich[*].int_lb_nsg_id],0))
    # "abudhabi"     = one(element([module.abudhabi[*].int_lb_nsg_id],0))
    # "dubai"        = one(element([module.dubai[*].int_lb_nsg_id],0))
    # "jeddah"       = one(element([module.jeddah[*].int_lb_nsg_id],0))
    # "jerusalem"    = one(element([module.jerusalem[*].int_lb_nsg_id],0))
    # "melbourne"    = one(element([module.melbourne[*].int_lb_nsg_id],0))
    # "sydney"       = one(element([module.sydney[*].int_lb_nsg_id],0))
    # "santiago"     = one(element([module.santiago[*].int_lb_nsg_id],0))
    # "saupaulo"     = one(element([module.saupaulo[*].int_lb_nsg_id],0))
    # "vinhedo"      = one(element([module.vinhedo[*].int_lb_nsg_id],0))
    # "ashburn"      = one(element([module.ashburn[*].int_lb_nsg_id],0))
    # "chicago"      = one(element([module.chicago[*].int_lb_nsg_id],0))
    # "montreal"     = one(element([module.montreal[*].int_lb_nsg_id],0))
    # "phoenix"      = one(element([module.phoenix[*].int_lb_nsg_id],0))
    # "queretaro"    = one(element([module.queretaro[*].int_lb_nsg_id],0))
    # "sanjose"      = one(element([module.sanjose[*].int_lb_nsg_id],0))
    # "toronto"      = one(element([module.toronto[*].int_lb_nsg_id],0))       
  }
}

output "pub_nsg_ids" {
  value = {
    # "johannesburg" = one(element([module.johannesburg[*].pub_lb_nsg_id],0))
    # "chuncheon"    = one(element([module.chuncheon[*].pub_lb_nsg_id],0))
    # "hyderabad"    = one(element([module.hyderabad[*].pub_lb_nsg_id],0))
    # "mumbai"       = one(element([module.mumbai[*].pub_lb_nsg_id],0))
    # "osaka"        = one(element([module.osaka[*].pub_lb_nsg_id],0))
    # "seoul"        = one(element([module.seoul[*].pub_lb_nsg_id],0))
    # "singapore"    = one(element([module.singapore[*].pub_lb_nsg_id],0))
    # "tokyo"        = one(element([module.tokyo[*].pub_lb_nsg_id],0))
    # "amsterdam"    = one(element([module.amsterdam[*].pub_lb_nsg_id],0))
    # "frankfurt"    = one(element([module.frankfurt[*].pub_lb_nsg_id],0))
    # "london"       = one(element([module.london[*].pub_lb_nsg_id],0))
    # "madrid"       = one(element([module.madrid[*].pub_lb_nsg_id],0))
    # "marseille"    = one(element([module.marseille[*].pub_lb_nsg_id],0))
    # "milan"        = one(element([module.milan[*].pub_lb_nsg_id],0))
    # "newport"      = one(element([module.newport[*].pub_lb_nsg_id],0))
    # "paris"        = one(element([module.paris[*].pub_lb_nsg_id],0))
    # "stockholm"    = one(element([module.stockholm[*].pub_lb_nsg_id],0))
    # "zurich"       = one(element([module.zurich[*].pub_lb_nsg_id],0))
    # "abudhabi"     = one(element([module.abudhabi[*].pub_lb_nsg_id],0))
    # "dubai"        = one(element([module.dubai[*].pub_lb_nsg_id],0))
    # "jeddah"       = one(element([module.jeddah[*].pub_lb_nsg_id],0))
    # "jerusalem"    = one(element([module.jerusalem[*].pub_lb_nsg_id],0))
    # "melbourne"    = one(element([module.melbourne[*].pub_lb_nsg_id],0))
    # "sydney"       = one(element([module.sydney[*].pub_lb_nsg_id],0))
    # "santiago"     = one(element([module.santiago[*].pub_lb_nsg_id],0))
    # "saupaulo"     = one(element([module.saupaulo[*].pub_lb_nsg_id],0))
    # "vinhedo"      = one(element([module.vinhedo[*].pub_lb_nsg_id],0))
    # "ashburn"      = one(element([module.ashburn[*].pub_lb_nsg_id],0))
    # "chicago"      = one(element([module.chicago[*].pub_lb_nsg_id],0))
    # "montreal"     = one(element([module.montreal[*].pub_lb_nsg_id],0))
    # "phoenix"      = one(element([module.phoenix[*].pub_lb_nsg_id],0))
    # "queretaro"    = one(element([module.queretaro[*].pub_lb_nsg_id],0))
    # "sanjose"      = one(element([module.sanjose[*].pub_lb_nsg_id],0))
    # "toronto"      = one(element([module.toronto[*].pub_lb_nsg_id],0))       
  }
}

output "int_lb_subnet_ids" {
  value = {
    # "johannesburg" = one(element([module.johannesburg[*].int_lb_subnet_id],0))
    # "chuncheon"    = one(element([module.chuncheon[*].int_lb_subnet_id],0))
    # "hyderabad"    = one(element([module.hyderabad[*].int_lb_subnet_id],0))
    # "mumbai"       = one(element([module.mumbai[*].int_lb_subnet_id],0))
    # "osaka"        = one(element([module.osaka[*].int_lb_subnet_id],0))
    # "seoul"        = one(element([module.seoul[*].int_lb_subnet_id],0))
    # "singapore"    = one(element([module.singapore[*].int_lb_subnet_id],0))
    # "tokyo"        = one(element([module.tokyo[*].int_lb_subnet_id],0))
    # "amsterdam"    = one(element([module.amsterdam[*].int_lb_subnet_id],0))
    # "frankfurt"    = one(element([module.frankfurt[*].int_lb_subnet_id],0))
    # "london"       = one(element([module.london[*].int_lb_subnet_id],0))
    # "madrid"       = one(element([module.madrid[*].int_lb_subnet_id],0))
    # "marseille"    = one(element([module.marseille[*].int_lb_subnet_id],0))
    # "milan"        = one(element([module.milan[*].int_lb_subnet_id],0))
    # "newport"      = one(element([module.newport[*].int_lb_subnet_id],0))
    # "paris"        = one(element([module.paris[*].int_lb_subnet_id],0))
    # "stockholm"    = one(element([module.stockholm[*].int_lb_subnet_id],0))
    # "zurich"       = one(element([module.zurich[*].int_lb_subnet_id],0))
    # "abudhabi"     = one(element([module.abudhabi[*].int_lb_subnet_id],0))
    # "dubai"        = one(element([module.dubai[*].int_lb_subnet_id],0))
    # "jeddah"       = one(element([module.jeddah[*].int_lb_subnet_id],0))
    # "jerusalem"    = one(element([module.jerusalem[*].int_lb_subnet_id],0))
    # "melbourne"    = one(element([module.melbourne[*].int_lb_subnet_id],0))
    # "sydney"       = one(element([module.sydney[*].int_lb_subnet_id],0))
    # "santiago"     = one(element([module.santiago[*].int_lb_subnet_id],0))
    # "saupaulo"     = one(element([module.saupaulo[*].int_lb_subnet_id],0))
    # "vinhedo"      = one(element([module.vinhedo[*].int_lb_subnet_id],0))
    # "ashburn"      = one(element([module.ashburn[*].int_lb_subnet_id],0))
    # "chicago"      = one(element([module.chicago[*].int_lb_subnet_id],0))
    # "montreal"     = one(element([module.montreal[*].int_lb_subnet_id],0))
    # "phoenix"      = one(element([module.phoenix[*].int_lb_subnet_id],0))
    # "queretaro"    = one(element([module.queretaro[*].int_lb_subnet_id],0))
    # "sanjose"      = one(element([module.sanjose[*].int_lb_subnet_id],0))
    # "toronto"      = one(element([module.toronto[*].int_lb_subnet_id],0))
  }
}
