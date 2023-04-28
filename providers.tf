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
  region              = var.regions["johannesburg"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "johannesburg"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["sydney"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "sydney"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["melbourne"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "melbourne"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["tokyo"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "tokyo"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["osaka"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "osaka"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["mumbai"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "mumbai"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["hyderabad"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "hyderabad"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["seoul"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "seoul"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["chuncheon"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "chuncheon"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["singapore"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "singapore"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["paris"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "paris"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["marseille"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "marseille"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["frankfurt"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "frankfurt"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["milan"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "milan"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["amsterdam"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "amsterdam"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["madrid"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "madrid"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["stockholm"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "stockholm"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["zurich"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "zurich"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["london"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "london"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["newport"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "newport"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["jerusalem"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "jerusalem"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["jeddah"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "jeddah"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["abudhabi"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "abudhabi"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["dubai"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "dubai"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["queretaro"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "queretaro"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["saupaulo"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "saupaulo"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["vinhedo"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "vinhedo"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["santiago"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "santiago"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["montreal"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "montreal"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["toronto"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "toronto"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["ashburn"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "ashburn"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["chicago"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "chicago"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["phoenix"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "phoenix"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  fingerprint         = var.api_fingerprint
  private_key_path    = var.api_private_key_path
  region              = var.regions["sanjose"]
  tenancy_ocid        = var.tenancy_id
  user_ocid           = var.user_id
  alias               = "sanjose"
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

