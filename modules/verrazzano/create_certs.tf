# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "create_cert_secret" {
  for_each = local.managed_clusters

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
    content     = lookup(local.create_cert_script, each.key)
    destination = "/home/opc/vz/certs/create_cert_secret_${each.key}.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -f \"$HOME/vz/certs/create_oci_secret_${each.key}.sh\" ]; then bash \"$HOME/vz/ocertsci/create_oci_secret_${each.key}.sh\";fi"
    ]
  }

  depends_on = [null_resource.check_managed_vz]

  triggers = {
    clusters = length(var.cluster_ids)
  }
}