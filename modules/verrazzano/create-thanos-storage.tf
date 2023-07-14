# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "create_thanos_storage" {
  for_each = alltrue([var.install_verrazzano, tobool(lookup(var.thanos, "enabled", "false"))]) ? var.all_cluster_ids : {}
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
    content     = try(lookup(local.thanos_storage_templates, each.key))
    destination = "/home/opc/vz/clusters/thanos_${each.key}_storage.yaml"
  }

  depends_on = [null_resource.install_vz_operator]

  triggers = {
    clusters = length(var.all_cluster_ids)
  }
}
