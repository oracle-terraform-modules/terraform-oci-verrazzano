# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl
# OCI Provider parameters
variable "home_region" {
  type = string
}

variable "tenancy_id" {
  type = string
}

# General OCI parameters
variable "compartment_id" {
  type = string
}

variable "label_prefix" {
  type = string
}

# ssh keys
variable "ssh_public_key_path" {
  type = string
}

# networking
variable "cidrs" {
  type = map(any)
}

variable "connectivity_mode" {
  type = string
}

# kubernetes
variable "kubernetes_version" {
  type = string
}

# clusters

variable "admin_region" {
  type = map(any)
}

variable "clusters" {
  type = map(bool)
}

variable "oke_control_plane" {
  type = string
}

variable "preferred_cni" {
  type = string
}

variable "nodepools" {
  type = any
}

variable "cloudinit_nodepool_common" {
  type        = string
}

variable "thanos" {
  type        = map(string)
}