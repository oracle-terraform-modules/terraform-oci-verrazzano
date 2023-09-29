# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

variable "label_prefix" {
  type = string
}

variable "bastion_ip" {
  type = string
}
variable "operator_ip" {
  type = string
}

variable "ssh_private_key_path" {
  type = string
}

variable "cluster_type" {
  type = string
}

# verrazzano
variable "install_verrazzano" {
  type = bool
}

variable "verrazzano_version" {
  type = string
}

# verrazzano infrastructure
variable "admin_region" {
  type = map(any)
}

variable "oke_control_plane" {
  type = string
}

variable "verrazzano_profile" {
  type = string
}

variable "verrazzano_control_plane" {
  type = string
}

variable "verrazzano_data_plane" {
  type = string
}

variable "verrazzano_load_balancer" {
  type = map(string)
}

variable "all_cluster_ids" {
  type = map(string)
}


variable "managed_cluster_ids" {
  type = map(string)
}

variable "int_nsg_ids" {
  type = map(string)
}

variable "int_lb_subnet_ids" {
  type = map(string)
}

variable "pub_nsg_ids" {
  type = map(string)
}

# verrazzano
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
  description = "Whether to install coherence"
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
  description = "Whether to install fluentd"
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
  default     = true
  description = "Whether to install kubeStateMetrics"
  type        = bool
}

variable "opensearch" {
  default     = true
  description = "Whether to install kubeStateMetrics"
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

variable "rancher" {
  default     = true
  description = "Whether to install Rancher"
  type        = bool
}

variable "thanos" {
  description = "Thanos configuration"
  type        = map(string)
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
  type = string
}

variable "dns_secret_id" {
  type = string
}

variable "dns_zone_id" {
  type = string
}

variable "dns_zone_name" {
  type = string
}

# istio

variable "mesh_id" {
  type = string
}

variable "istio_model" {
  default     = "single"
  description = "The deployment model of Istio to use when deploying multiple clusters"
  type        = string
}