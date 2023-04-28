# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "null_resource" "install_vz_admin" {
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
    content     = local.vz_admin_template
    destination = "/home/opc/vz/clusters/install_vz_admin.yaml"
  }

  provisioner "file" {
    content     = local.install_admin_script
    destination = "/home/opc/vz/clusters/install_vz_admin.sh"
  }


  depends_on = [null_resource.create_oci_secret]

  count = var.install_vz == true ? 1 : 0
}

resource "null_resource" "install_managed_vz" {

  for_each = var.install_vz == true ? local.managed_clusters : {}

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
    content     = lookup(local.install_managed_vz_templates, each.key)
    destination = "/home/opc/vz/clusters/vz_mc_${each.key}.yaml"
  }

  provisioner "file" {
    content     = lookup(local.install_managed_vz_script, each.key)
    destination = "/home/opc/vz/clusters/install_vz_cluster_${each.key}.sh"
  }

  depends_on = [null_resource.install_vz_admin]

}

resource "null_resource" "check_managed_vz" {

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
    content     = local.check_vz_cluster_script
    destination = "/home/opc/vz/clusters/vz_status.sh"
  }

  depends_on = [null_resource.install_managed_vz]

  count = var.install_vz == true ? 1 : 0

  triggers = {
    clusters = length(local.cluster_ids)
  }

}
