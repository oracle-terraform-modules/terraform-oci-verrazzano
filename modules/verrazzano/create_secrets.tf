# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "get_oci_secret" {
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
    content     = local.get_oci_secret_template
    destination = "/home/opc/vz/oci/get_oci_secret.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -f \"$HOME/vz/oci/get_oci_secret.sh\" ]; then bash \"$HOME/vz/oci/get_oci_secret.sh\";fi",
    ]
  }

  depends_on = [null_resource.check_vz_operator]

  count = alltrue([var.install_verrazzano, var.configure_dns]) ? 1 : 0

}

resource "null_resource" "create_oci_secret" {
  for_each = alltrue([var.install_verrazzano, var.configure_dns]) ? var.all_cluster_ids : {}
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
    content     = lookup(local.create_oci_secret_templates, each.key)
    destination = "/home/opc/vz/oci/create_oci_secret_${each.key}.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -f \"$HOME/vz/certs/create_oci_secret_${each.key}.sh\" ]; then bash \"$HOME/vz/certs/create_oci_secret_${each.key}.sh\"; sleep 10; fi"
    ]
  }

  depends_on = [null_resource.get_oci_secret]

  triggers = {
    clusters = length(var.all_cluster_ids)
  }

}


