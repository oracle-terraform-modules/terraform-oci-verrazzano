# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "install_vz_admin" {
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
    content     = local.vz_admin_template
    destination = "/home/opc/vz/clusters/vz_${local.admin_region_name}.yaml"
  }

  provisioner "file" {
    content     = local.install_admin_script
    destination = "/home/opc/vz/clusters/install_vz_cluster_${local.admin_region_name}.sh"
  }

  provisioner "file" {
    content     = local.vz_access_template
    destination = "/home/opc/bin/vz_access.sh"
  }  

  # provisioner "remote-exec" {
  #   inline = [
  #     "if [ -f \"$HOME/opc/vz/operator/install_vz_admin.sh\" ]; then bash \"$HOME/opc/vz/operator/install_vz_admin.sh\";fi",
  #   ]
  # }

  depends_on = [null_resource.check_vz_operator]

  count = tobool(var.install_verrazzano) ? 1 : 0
}

resource "null_resource" "install_managed_vz" {

  for_each = tobool(var.install_verrazzano) ? local.managed_clusters : {}

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
    content     = lookup(local.install_managed_vz_templates, each.key)
    destination = "/home/opc/vz/clusters/vz_mc_${each.key}.yaml"
  }

  provisioner "file" {
    content     = lookup(local.install_managed_vz_script, each.key)
    destination = "/home/opc/vz/clusters/install_vz_cluster_${each.key}.sh"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "if [ -f \"$HOME/opc/vz/operator/install_vz_cluster_${each.key}.sh\" ]; then bash \"$HOME/opc/vz/operator/install_vz_cluster_${each.key}.sh\";sleep 10;fi",
  #   ]
  # }

  depends_on = [null_resource.install_vz_admin]

}

resource "null_resource" "check_managed_vz" {

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
    content     = local.check_vz_cluster_script
    destination = "/home/opc/vz/clusters/vz_status.sh"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "if [ -f \"$HOME/opc/vz/operator/vz_status.sh\" ]; then bash \"$HOME/opc/vz/operator/vz_status.sh\";fi",
  #   ]
  # }

  depends_on = [null_resource.install_managed_vz]
  triggers = {
    clusters = length(var.cluster_ids)
  }

  count = tobool(var.install_verrazzano) ? 1 : 0
}
