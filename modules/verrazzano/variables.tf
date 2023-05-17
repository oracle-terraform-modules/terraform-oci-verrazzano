# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

variable "bastion_ip" {
  type = string
}
variable "operator_ip" {
  type = string
}

variable "ssh_private_key_path" {
  type = string
}

variable "install_verrazzano" {
  type = bool
}

variable "verrazzano_version" {
  type = string
}

variable "admin_region" {
  type = map(any)
}

variable "verrazzano_profile" {
  type = string
}

variable "verrazzano_control_plane" {
}

variable "verrazzano_data_plane" {
}

variable "verrazzano_load_balancer" {
  type        = map(string)
}

variable "cluster_ids" {
  type = map(any)
}

variable "int_nsg_ids" {
  type = map(any)
}

variable "pub_nsg_ids" {
  type = map(any)
}
# dns
variable "configure_dns" {
  type = bool
}

variable "secret_id" {
  type = string
}

variable "dns_zone_id" {
  type = string
}

variable "dns_compartment_id" {
  type = string
}

variable "dns_zone_name" {
  type = string
}