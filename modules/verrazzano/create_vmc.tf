# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "create_vmc" {
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
    content     = local.vmc_template
    destination = "/home/opc/vz/clusters/vmc_${each.key}.yaml"
  }

  provisioner "file" {
    content     = lookup(local.create_vmc_script, each.key)
    destination = "/home/opc/vz/clusters/create_vmc_${each.key}.sh"
  }

  depends_on = [null_resource.create_api_cm]

  triggers = {
    clusters = length(var.cluster_ids)
  }

}
