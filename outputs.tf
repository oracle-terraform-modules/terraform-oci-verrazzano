# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "ssh_to_admin_operator" {
  description = "convenient command to ssh to the Admin operator host"
  value       = module.admin.ssh_to_operator
}