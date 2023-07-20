# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "setup_vz_env" {
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
    content     = local.setup_vz_env_template
    destination = "/home/opc/setup_vz_env.sh"
  }

  provisioner "file" {
    content     = local.token_helper_template
    destination = "/home/opc/token_helper.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -f \"$HOME/setup_vz_env.sh\" ]; then bash \"$HOME/setup_vz_env.sh\";sleep 10;fi",
      "chmod +x $HOME/token_helper.sh",
      "mkdir -p $HOME/bin",
      "mv $HOME/token_helper.sh $HOME/bin",
    ]
  }

count = tobool(var.install_verrazzano) ? 1 : 0
}
