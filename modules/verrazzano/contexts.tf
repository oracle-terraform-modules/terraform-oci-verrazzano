# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "set_contexts" {
  for_each = var.all_cluster_ids
  connection {
    host        = var.operator_ip
    private_key = file(var.ssh_private_key_path)
    timeout     = "40m"
    type        = "ssh"
    user        = "opc"

    bastion_host        = var.bastion_ip
    bastion_user        = "opc"
    bastion_private_key = file(var.ssh_private_key_path)
  }

  provisioner "file" {
    content     = lookup(local.kubeconfig_templates, each.key)
    destination = "/home/opc/generate_kubeconfig_${each.key}.sh"
  }

  provisioner "file" {
    content     = lookup(local.set_credentials_templates, each.key)
    destination = "/home/opc/kubeconfig_set_credentials_${each.key}.sh"
  }

  provisioner "file" {
    content     = lookup(local.set_alias_templates, each.key)
    destination = "/home/opc/set_alias_${each.key}.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -f \"$HOME/generate_kubeconfig_${each.key}.sh\" ]; then bash \"$HOME/generate_kubeconfig_${each.key}.sh\";fi",
      "if [ -f \"$HOME/kubeconfig_set_credentials_${each.key}.sh\" ]; then bash \"$HOME/kubeconfig_set_credentials_${each.key}.sh\";fi",
      "if [ -f \"$HOME/set_alias_${each.key}.sh\" ]; then bash \"$HOME/set_alias_${each.key}.sh\";fi",
    ]
  }

  triggers = {
    clusters = length(var.managed_cluster_ids)
  }

  lifecycle {
    create_before_destroy = true
  }

}