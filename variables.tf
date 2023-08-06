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
    johannesburg = { vcn = "10.1.0.0/16", pods = "10.201.0.0/16", services = "10.101.0.0/16" }

    # Asia
    chuncheon = { vcn = "10.2.0.0/16", pods = "10.202.0.0/16", services = "10.102.0.0/16" }
    hyderabad = { vcn = "10.3.0.0/16", pods = "10.203.0.0/16", services = "10.103.0.0/16" }
    mumbai    = { vcn = "10.4.0.0/16", pods = "10.204.0.0/16", services = "10.104.0.0/16" }
    osaka     = { vcn = "10.5.0.0/16", pods = "10.205.0.0/16", services = "10.105.0.0/16" }
    seoul     = { vcn = "10.6.0.0/16", pods = "10.206.0.0/16", services = "10.106.0.0/16" }
    singapore = { vcn = "10.7.0.0/16", pods = "10.207.0.0/16", services = "10.107.0.0/16" }
    tokyo     = { vcn = "10.8.0.0/16", pods = "10.208.0.0/16", services = "10.108.0.0/16" }

    # Europe
    amsterdam = { vcn = "10.9.0.0/16", pods = "10.209.0.0/16", services = "10.109.0.0/16" }
    frankfurt = { vcn = "10.10.0.0/16", pods = "10.210.0.0/16", services = "10.110.0.0/16" }
    london    = { vcn = "10.11.0.0/16", pods = "10.211.0.0/16", services = "10.111.0.0/16" }
    madrid    = { vcn = "10.12.0.0/16", pods = "10.212.0.0/16", services = "10.112.0.0/16" }
    marseille = { vcn = "10.13.0.0/16", pods = "10.213.0.0/16", services = "10.113.0.0/16" }
    milan     = { vcn = "10.14.0.0/16", pods = "10.214.0.0/16", services = "10.114.0.0/16" }
    newport   = { vcn = "10.15.0.0/16", pods = "10.215.0.0/16", services = "10.115.0.0/16" }
    paris     = { vcn = "10.16.0.0/16", pods = "10.216.0.0/16", services = "10.116.0.0/16" }
    stockholm = { vcn = "10.17.0.0/16", pods = "10.217.0.0/16", services = "10.117.0.0/16" }
    zurich    = { vcn = "10.18.0.0/16", pods = "10.218.0.0/16", services = "10.118.0.0/16" }

    # Middle East
    abudhabi  = { vcn = "10.19.0.0/16", pods = "10.219.0.0/16", services = "10.119.0.0/16" }
    dubai     = { vcn = "10.20.0.0/16", pods = "10.220.0.0/16", services = "10.120.0.0/16" }
    jeddah    = { vcn = "10.21.0.0/16", pods = "10.221.0.0/16", services = "10.121.0.0/16" }
    jerusalem = { vcn = "10.22.0.0/16", pods = "10.222.0.0/16", services = "10.122.0.0/16" }

    # Oceania
    melbourne = { vcn = "10.23.0.0/16", pods = "10.223.0.0/16", services = "10.123.0.0/16" }
    sydney    = { vcn = "10.24.0.0/16", pods = "10.224.0.0/16", services = "10.124.0.0/16" }

    # South America
    santiago = { vcn = "10.25.0.0/16", pods = "10.225.0.0/16", services = "10.125.0.0/16" }
    saupaulo = { vcn = "10.26.0.0/16", pods = "10.226.0.0/16", services = "10.126.0.0/16" }
    vinhedo  = { vcn = "10.27.0.0/16", pods = "10.227.0.0/16", services = "10.127.0.0/16" }

    # North America
    ashburn   = { vcn = "10.28.0.0/16", pods = "10.228.0.0/16", services = "10.128.0.0/16" }
    chicago   = { vcn = "10.29.0.0/16", pods = "10.229.0.0/16", services = "10.129.0.0/16" }
    montreal  = { vcn = "10.30.0.0/16", pods = "10.230.0.0/16", services = "10.130.0.0/16" }
    phoenix   = { vcn = "10.31.0.0/16", pods = "10.231.0.0/16", services = "10.131.0.0/16" }
    queretaro = { vcn = "10.32.0.0/16", pods = "10.232.0.0/16", services = "10.132.0.0/16" }
    sanjose   = { vcn = "10.33.0.0/16", pods = "10.233.0.0/16", services = "10.133.0.0/16" }
    toronto   = { vcn = "10.34.0.0/16", pods = "10.234.0.0/16", services = "10.134.0.0/16" }
  }
}

variable "connectivity_mode" {
  default     = "star"
  description = "Whether to keep set up connectivity in mesh or star mode. Admin is always connected to every managed cluster. In star mode, managed clusters are only connected with admin; in mesh mode, all clusters are connected as peers."
  type        = string

  validation {
    condition     = contains(["mesh", "star"], lower(var.connectivity_mode))
    error_message = "Accepted values are 'mesh' or 'star'."
  }
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

variable "kubernetes_version" {
  default     = "v1.26.2"
  description = "The version of Kubernetes to use."
  type        = string
}

variable "oke_control_plane" {
  default     = "public"
  description = "Whether to keep all OKE control planes public or private."
  type        = string

  validation {
    condition     = contains(["public", "private"], lower(var.oke_control_plane))
    error_message = "Accepted values are 'public' or 'private'."
  }
}

variable "preferred_cni" {
  default     = "flannel"
  description = "Whether to use flannel or NPN"
  type        = string

  validation {
    condition     = contains(["flannel", "npn"], lower(var.preferred_cni))
    error_message = "Accepted values are 'flannel' or 'npn'."
  }
}

variable "managed_clusters" {
  description = "A map of OCI regions where managed clusters will be created."
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

# node pools
variable "nodepools" {
  type        = any
  description = "Node pools for all clusters"
  default = {
    np1 = {
      shape            = "VM.Standard.E4.Flex",
      ocpus            = 2,
      memory           = 32,
      node_pool_size   = 3,
      boot_volume_size = 150,
    }
  }
}

variable "worker_cloud_init" {
  default     = []
  description = "List of maps containing cloud init MIME part configuration for worker nodes. Merged with pool-specific definitions. See https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config.html#part for expected schema of each element."
  type        = list(map(string))
}

# verrazzano

variable "get_kubeconfigs" {
  default     = true
  description = "Whether to set up access to the clusters."
  type        = bool
}

variable "install_verrazzano" {
  default     = false
  description = "Whether ready to install Verrazzano"
  type        = bool
}

variable "verrazzano_version" {
  default     = "1.6.3"
  description = "Verrazzano version to install"
  type        = string
}

# verrazzano infrastructure
variable "verrazzano_profile" {
  default     = "dev"
  description = "Verrazzano profile to install"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], lower(var.verrazzano_profile))
    error_message = "Accepted values are 'dev' or 'prod'."
  }
}

variable "verrazzano_control_plane" {
  default     = "public"
  description = "Whether to keep all Verrazzano control planes (nginx) public or private"
  type        = string

  validation {
    condition     = contains(["public", "private"], lower(var.verrazzano_control_plane))
    error_message = "Accepted values are 'public' or 'private'."
  }
}

variable "verrazzano_data_plane" {
  default     = "public"
  description = "Whether to keep all Verrazzano data planes (Istio Ingress Gateway) public or private"
  type        = string

  validation {
    condition     = contains(["public", "private"], lower(var.verrazzano_data_plane))
    error_message = "Accepted values are 'public' or 'private'."
  }
}

variable "verrazzano_load_balancer" {
  description = "Load Balancer Shape"
  type        = map(string)
  default = {
    shape    = "10Mbps"
    flex_min = "25"
    flex_max = "50"
  }
}

# Verrazzano components
variable "argocd" {
  default     = true
  description = "Whether to install ArgoCD"
  type        = bool
}

variable "cluster_api" {
  default     = true
  description = "Whether to enable Cluster API"
  type        = bool
}

variable "coherence" {
  default     = false
  description = "Whether to install Coherence Operator"
  type        = bool
}

variable "configure_dns" {
  default     = false
  description = "Whether to configure DNS. If not configured, nip.io will be used"
  type        = bool
}

variable "console" {
  default     = false
  description = "Whether to install Verrazzano console"
  type        = bool
}

variable "fluentd" {
  default     = true
  description = "Whether to install fluentd"
  type        = bool
}

variable "grafana" {
  default     = true
  description = "Whether to install Grafana"
  type        = bool
}

variable "jaeger" {
  default     = true
  description = "Whether to install Jaeger"
  type        = bool
}

variable "kiali" {
  default     = true
  description = "Whether to install Jaeger"
  type        = bool
}

variable "kube_state_metrics" {
  default     = false
  description = "Whether to capture Kube State Metrics"
  type        = bool
}

variable "opensearch" {
  default     = true
  description = "Whether to install OpenSearch"
  type        = bool
}

variable "opensearch_dashboards" {
  default     = true
  description = "Whether to install OpenSearch Dashboards"
  type        = bool
}

variable "prometheus" {
  default     = true
  description = "Whether to create an instance of Prometheus"
  type        = bool
}

variable "prometheus_operator" {
  default     = true
  description = "Whether to install Prometheus Operator"
  type        = bool
}

variable "thanos" {
  description = "Thanos configuration"
  type        = map(string)
}

variable "rancher" {
  default     = true
  description = "Whether to install Rancher"
  type        = bool
}

variable "velero" {
  default     = false
  description = "Whether to install velero"
  type        = bool
}

variable "weblogic_operator" {
  default     = false
  description = "Whether to install WebLogic Operator"
  type        = bool
}

# dns
variable "dns_compartment_id" {
  default     = ""
  description = "DNS Zone's Compartment id"
  type        = string
}

variable "dns_secret_id" {
  default     = ""
  description = "OCID of oci secret to be used for OCI DNS authentication."
  type        = string
}

variable "dns_zone_id" {
  default     = ""
  description = "DNS Zone OCID in OCI DNS"
  type        = string
}

variable "dns_zone_name" {
  default     = ""
  description = "DNS Zone Name"
  type        = string
}



# istio
variable "mesh_id" {
  default     = "vz"
  description = "The name of the mesh to use"
  type        = string
}

variable "istio_model" {
  default     = "single"
  description = "The deployment model of Istio to use when using multiple clusters"
  type        = string
}
