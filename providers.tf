# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.home_region
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "home"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["johannesburg"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "johannesburg"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["sydney"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "sydney"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["melbourne"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "melbourne"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["tokyo"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "tokyo"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["osaka"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "osaka"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["mumbai"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "mumbai"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["hyderabad"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "hyderabad"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["seoul"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "seoul"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["chuncheon"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "chuncheon"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["singapore"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "singapore"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["paris"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "paris"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["marseille"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "marseille"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["frankfurt"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "frankfurt"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["milan"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "milan"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["amsterdam"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "amsterdam"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["madrid"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "madrid"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["stockholm"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "stockholm"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["zurich"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "zurich"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["london"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "london"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["newport"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "newport"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["jerusalem"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "jerusalem"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["jeddah"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "jeddah"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["abudhabi"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "abudhabi"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["dubai"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "dubai"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["queretaro"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "queretaro"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["saupaulo"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "saupaulo"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["vinhedo"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "vinhedo"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["santiago"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "santiago"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["montreal"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "montreal"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["toronto"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "toronto"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["ashburn"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "ashburn"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["chicago"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "chicago"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["phoenix"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "phoenix"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = local.regions["sanjose"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "sanjose"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

