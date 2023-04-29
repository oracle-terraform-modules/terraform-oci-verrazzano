# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "install_vz_cli" {
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
    content     = local.install_vz_cli_template
    destination = "/home/opc/vz_cli.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -f \"$HOME/vz_cli.sh\" ]; then bash \"$HOME/vz_cli.sh\";fi",
    ]
  }

}
resource "null_resource" "install_vz_operator" {
  for_each = var.install_vz == true ? local.all_clusters : {}

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
    content     = lookup(local.install_vz_operator_templates, each.key)
    destination = "/home/opc/vz/operator/install_vz_operator_${each.key}.sh"
  }

  depends_on = [null_resource.setup_vz_env]

  triggers = {
    clusters = length(var.cluster_ids)
  }

}

resource "null_resource" "check_vz_operator" {
  for_each = var.install_vz == true ? local.all_clusters : {}

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
    content     = lookup(local.check_vz_operator_templates, each.key)
    destination = "/home/opc/vz/operator/check_vz_operator_${each.key}.sh"
  }

  depends_on = [null_resource.install_vz_operator]

  triggers = {
    clusters = length(var.cluster_ids)
  }

}
