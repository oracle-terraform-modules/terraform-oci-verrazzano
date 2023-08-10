# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "configure_capi_oke" {
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
    content     = local.capi_template
    destination = "/home/opc/vz/capi/capi-oke.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "if [ -f \"$HOME/vz/capi/configure_capi.sh\" ]; then echo \"envsubst < capi-secret.yaml | kubectl apply -f -\" > \"$HOME/vz/capi/configure_capi.sh\";sleep 10;fi",
    ]
  }

  count =  (var.install_verrazzano && var.cluster_api ) ? 1 :0

}
