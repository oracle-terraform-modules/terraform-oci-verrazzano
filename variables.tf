# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl
# OCI Provider parameters
variable "api_fingerprint" {
  default     = ""
  description = "Fingerprint of the API private key to use with OCI API."
  type        = string
}

variable "api_private_key_path" {
  default     = ""
  description = "The path to the OCI API private key."
  type        = string
}

variable "regions" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "A map of OCI regions."
  type        = map(string)
  default = {
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
}

variable "home_region" {
  description = "The tenancy's home region."
  type        = string
}

variable "tenancy_id" {
  description = "The tenancy id of the OCI Cloud Account in which to create the resources."
  type        = string
}

variable "user_id" {
  description = "The id of the user that terraform will use to create the resources."
  type        = string
  default     = ""
}

# General OCI parameters
variable "compartment_id" {
  description = "The compartment id where to create all resources."
  type        = string
}

variable "label_prefix" {
  default     = "none"
  description = "A string that will be prepended to all resources."
  type        = string
}

# ssh keys
variable "ssh_private_key_path" {
  default     = "none"
  description = "The path to ssh private key."
  type        = string
}

variable "ssh_public_key_path" {
  default     = "none"
  description = "The path to ssh public key."
  type        = string
}

# networking
variable "cidrs" {
  description = "A map of cidrs for vcns, pods and services for each region"
  type        = map(any)
  default = {
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
}

variable "connectivity_mode" {
  default     = "star"
  description = "Whether to keep set up connectivity in mesh or star mode. Admin is always connected to everybody"
  type        = string

  validation {
    condition     = contains(["mesh", "star"], lower(var.connectivity_mode))
    error_message = "Accepted values are 'mesh' or 'star'."
  }
}

# kubernetes

variable "configure_clusters" {
  default     = true
  description = "Whether to set up access to the clusters."
  type        = bool
}

variable "kubernetes_version" {
  default     = "v1.24.1"
  description = "The version of Kubernetes to use."
  type        = string
}

# clusters

variable "admin_region" {
  description = "The region parameters of the Admin cluster. In case a single cluster is created, the Admin region is used for the single cluster."
  type        = map(any)
  default = {
    admin_name = "admin"
    region     = "Sydney"
    vcn_cidr   = "10.0.0.0/16"
    pods       = "10.244.0.0/16"
    services   = "10.96.0.0/16"
  }
}

variable "control_plane_type" {
  default     = "public"
  description = "Whether to keep all control planes public or private"
  type        = string

  validation {
    condition     = contains(["public", "private"], lower(var.control_plane_type))
    error_message = "Accepted values are 'public' or 'private'."
  }
}

variable "clusters" {
  description = "map of clusters to enable"
  type        = map(bool)
  default = {
    # Africa
    johannesburg = false

    # Asia
    chuncheon = false
    hyderabad = false
    mumbai    = false
    osaka     = false
    seoul     = false
    singapore = false
    tokyo     = false

    # Europe
    amsterdam = false
    frankfurt = false
    london    = false
    madrid    = false
    marseille = false
    milan     = false
    newport   = false
    paris     = false
    stockholm = false
    zurich    = false

    # Middle East
    abudhabi  = false
    dubai     = false
    jeddah    = false
    jerusalem = false

    # Oceania
    melbourne = false
    sydney    = false

    # South America
    santiago = false
    saupaulo = false
    vinhedo  = false

    # North America
    ashburn   = false
    chicago   = false
    montreal  = false
    phoenix   = false
    queretaro = false
    sanjose   = false
    toronto   = false
  }
}

# verrazzano

variable "install_verrazzano" {
  default     = false
  description = "Whether ready to install Verrazzano"
  type        = bool
}

variable "verrazzano_version" {
  default     = "1.5.2"
  description = "Verrazzano version to install"
  type        = string
}

variable "verrazzano_profile" {
  default     = "dev"
  description = "Verrazzano profile to install"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], lower(var.verrazzano_profile))
    error_message = "Accepted values are 'dev' or 'prod'."
  }
}

# dns
variable "configure_dns" {
  default     = false
  description = "Whether ready to configure DNS"
  type        = bool
}

variable "secret_id" {
  default     = ""
  description = "ocid of oci secret"
  type        = string
}

variable "dns_zone_id" {
  default     = ""
  description = "DNS Zone ocid in OCI DNS"
  type        = string
}

variable "dns_compartment_id" {
  default     = ""
  description = "DNS Zone's Compartment id"
  type        = string
}

variable "dns_zone_name" {
  default     = ""
  description = "DNS Zone Name"
  type        = string
}
