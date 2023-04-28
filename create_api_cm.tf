# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "create_api_cm" {
  connection {
    host        = module.admin.operator_private_ip
    private_key = file(var.ssh_private_key_path)
    timeout     = "40m"
    type        = "ssh"
    user        = "opc"

    bastion_host        = module.admin.bastion_public_ip
    bastion_user        = "opc"
    bastion_private_key = file(var.ssh_private_key_path)
  }

  provisioner "file" {
    content     = local.api_cm_template
    destination = "/home/opc/vz/cm/api_cm.yaml"
  }

  provisioner "file" {
    content     = local.create_api_cm_template
    destination = "/home/opc/vz/cm/create_api_cm.sh"
  }

  depends_on = [null_resource.create_cert_secret]

  count = var.install_vz == true ? 1: 0

}
