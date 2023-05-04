---
title: "Single production cluster"
date: 2023-05-04T18:00:47+10:00
draft: true
weight: 2
---

### 1. Create the OKE cluster

1. Copy terraform.tfvars.example to terraform.tfvars
2. Provide values for the input variables `api_fingerprint`,`api_private_key_path`,`tenancy_id`,`user_id`, `compartment_id`, `ssh_public_key_path`, `ssh_private_key_path`.
3. Set your tenancy's home region using `home_region`.
4. Configure the cluster's provider in admin.tf:

```
  providers = {
    oci      = oci.sydney # replace with the desired region's name
    oci.home = oci.home
  }
```
5. Configure the cluster's parameters:

```
admin_region = {
  admin_name = "admin"
  region     = "Sydney" # must match the provider's region
  vcn_cidr   = "10.0.0.0/16"
  pods       = "10.200.0.0/16"
  services   = "10.100.0.0/16"
}
```
6. {{% badge style="primary" icon="fas fa-exclamation-triangle" %}}Important{{% /badge %}} Set `configure_clusters` and `install_verrazzano` to `false`:

```
configure_clusters = false
install_verrazzano = false
```

7. Create the cluster by running Terraform:

```
terraform init
terraform plan
terraform apply
```

### 2. Generate Verrazzano Installation scripts

1. {{% badge style="primary" icon="fas fa-exclamation-triangle" %}}Important{{% /badge %}} Set `configure_clusters` and `install_verrazzano` to `true`:

```
configure_clusters = true
install_verrazzano = true
```

2. Configure Verrazzano profile:

```
verrazzano_profile = "prod"
```

3. If you need to use your own DNS, you need to configure DNS before you run Terraform and the installation scripts. Else, the installation scripts will use nip.io.

4. Run Terraform again:
```
terraform init
terraform plan
terraform apply
```

### 3. Run Verrazzano Installation scripts

These steps are to be run manually today. We'll automate them in the future.

1. Install the operator

```
cd /home/opc/vz/operator
bash install_vz_operator_admin_cluster.sh
```

2. Check if the operator has installed sucessfully:

```
bash check_vz_operator_admin.sh
```

3. If you are using your own DNS domain, obtain the yaml for DNS and create a secret:

```
cd /home/opc/vz/oci
bash  get_oci_secret.sh
echo >> oci.yaml

bash create_oci_secret_admin.sh
```

4. Install Verrazzano:

```
cd /home/opc/vz/clusters
bash install_vz_admin.sh
```

5. Wait for Verrazzano to be installed:

```
bash vz_status.sh
```