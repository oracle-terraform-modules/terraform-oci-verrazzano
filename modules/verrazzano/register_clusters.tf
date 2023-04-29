# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "register_vmc" {
  for_each = var.install_vz == true ? local.managed_clusters : {}

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
    content     = lookup(local.register_vmc_templates, each.key)
    destination = "/home/opc/vz/clusters/register_vmc_${each.key}.sh"
  }

  depends_on = [null_resource.create_vmc]

  triggers = {
    clusters = length(var.cluster_ids)
  }
}
