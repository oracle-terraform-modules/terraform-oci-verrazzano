# With Public Endpoints

Use this configuration when you want the API endpoints of your OKE clusters to be public.
<!-- toc -->

```admonish tip
1. Edit the code in-place below to reflect your values.
2. Then click the "Copy to clipboard" icon.
```

### Create the clusters
1. Copy terraform.tfvars.example to terraform.tfvars:

```bash, editable
cp terraform.tfvars.example terraform.tfvars
```

#### Provider
1. Provide values for the following input variables in terraform.tfvars: 
   - `api_fingerprint`
   - `api_private_key_path`
   - `tenancy_id`
   - `user_id`
   - `compartment_id`
   - `ssh_public_key_path`
   - `ssh_private_key_path`

2. Set your tenancy's home region using `home_region` in terraform.tfvars e.g.

```terraform, editable
home_region = "us-ashburn-1"
```

#### Admin Cluster
1. Set the Admin region for where you want to place the Verrazzano Admin cluster. This should be the region name only e.g. `Sydney`. This should ***not*** be the region identifier `ap-sydney-1` e.g.

      ```terraform,editable
      admin_region = {
        admin_name = "admin"
        region     = "Sydney" # must match the provider's region in step 4
        vcn_cidr   = "10.0.0.0/16"
        pods       = "10.200.0.0/16"
        services   = "10.100.0.0/16"
      }
      ```

```admonish warning
If you change the CIDR values above, it is your responsibility to ensure they do not overlap:
1. with each other
2. with other clusters' CIDRs
3. with existing network in your environment if you are establishing connectivity
```

2. Change the provider of the Admin cluster  to its corresponding alias. The aliases can be found in providers.tf e.g. if you want to place your Admin cluster in Ashburn, you must change the provider from `oci.sydney` to `oci.ashburn`. This should be configured in `admin.tf` in the root module e.g.

```terraform,editable
  providers = {
    oci      = oci.ashburn
    oci.home = oci.home
  }
```

#### Managed Clusters
1. To create managed clusters in your preferred regions, set your preferred regions' values to `true` e.g. `ashburn=true` in the `clusters` parameter. Leave those that you do not use to `false` e.g.

```terraform, editable
clusters = {
  # Africa
  johannesburg = false

  # Asia
  chuncheon = false
  hyderabad = false
  mumbai    = false
  osaka     = false
  seoul     = false
  singapore = false
  tokyo     = false

  # Europe
  amsterdam = false
  frankfurt = false
  london    = false
  madrid    = false
  marseille = false
  milan     = false
  newport   = false
  paris     = false
  stockholm = false
  zurich    = false

  # Middle East
  abudhabi  = false
  dubai     = false
  jeddah    = false
  jerusalem = false

  # Oceania
  melbourne = false
  sydney    = false

  # South America
  santiago = false
  saupaulo = false
  vinhedo  = false

  # North America
  ashburn   = false
  chicago   = false
  montreal  = false
  phoenix   = true
  queretaro = false
  sanjose   = false
  toronto   = false
}
```

```admonish warning
Do not remove those that you are not using.
```

2. For the managed clusters you enable, uncomment them in `modules\clusters\outputs.tf` for `cluster_ids`, `int_nsg_ids` and `pub_nsg_ids`. For the clusters that you do not use, leave them commented e.g.

```terraform,editable
output "cluster_ids" {
  value = {
    # "johannesburg" = join(",", module.johannesburg[*].cluster_id)
    # "chuncheon"    = join(",", module.chuncheon[*].cluster_id)
    # "hyderabad"    = join(",", module.hyderabad[*].cluster_id)
    # "mumbai"       = join(",", module.mumbai[*].cluster_id)
    # "osaka"        = join(",", module.osaka[*].cluster_id)
    # "seoul"        = join(",", module.seoul[*].cluster_id)
    # "singapore"    = join(",", module.singapore[*].cluster_id)
    # "tokyo"        = join(",", module.tokyo[*].cluster_id)
    # "amsterdam"    = join(",", module.amsterdam[*].cluster_id)
    # "frankfurt"    = join(",", module.frankfurt[*].cluster_id)
    # "london"       = join(",", module.london[*].cluster_id)
    # "madrid"       = join(",", module.madrid[*].cluster_id)
    # "marseille"    = join(",", module.marseille[*].cluster_id)
    # "milan"        = join(",", module.milan[*].cluster_id)
    # "newport"      = join(",", module.newport[*].cluster_id)
    # "paris"        = join(",", module.paris[*].cluster_id)
    # "stockholm"    = join(",", module.stockholm[*].cluster_id)
    # "zurich"       = join(",", module.zurich[*].cluster_id)
    # "abudhabi"     = join(",", module.abudhabi[*].cluster_id)
    # "dubai"        = join(",", module.dubai[*].cluster_id)
    # "jeddah"       = join(",", module.jeddah[*].cluster_id)
    # "jerusalem"    = join(",", module.jerusalem[*].cluster_id)
    #"melbourne"    = join(",", module.melbourne[*].cluster_id)
    # "sydney"       = join(",", module.sydney[*].cluster_id)
    # "santiago"     = join(",", module.santiago[*].cluster_id)
    # "saupaulo"     = join(",", module.saupaulo[*].cluster_id)
    # "vinhedo"      = join(",", module.vinhedo[*].cluster_id)
    # "ashburn"      = join(",", module.ashburn[*].cluster_id)
    # "chicago"      = join(",", module.chicago[*].cluster_id)
    # "montreal"     = join(",", module.montreal[*].cluster_id)
    "phoenix"      = join(",", module.phoenix[*].cluster_id)
    # "queretaro"    = join(",", module.queretaro[*].cluster_id)
    # "sanjose"      = join(",", module.sanjose[*].cluster_id)
    # "toronto"      = join(",", module.toronto[*].cluster_id)
  }
}
```

```admonish warning
In the outputs.tf, you must uncomment only the regions where you are running the managed clusters, not your the region where your admin cluster is running.

Only uncomment the admin region in outputs if you happen to also run a managed cluster in the same region as your admin cluster.
```

3. Uncomment the respective clusters that you have enabled. The clusters are created in either {country, continent,region}.tf. e.g. Ashburn will be found in `usa.tf` under `modules\clusters`. Leave the clusters that you do not use as commented.

```admonish info
We pre-create aliased providers. But in doing so, Terraform then wants to check all configured regions and this can take some time. Instead, we want Terraform apply to happen as quickly as possible. That's why the need to comment/uncomment. We will look for a way to improve this in the future.
```

4. Configure the API endpoints for public access in terraform.tfvars:

```
oke_control_plane = "public"
```

5. When initially creating the clusters, configure the following input variables to be `false`:

```terraform,editable
get_kubeconfigs = false
install_verrazzano = false
```

```admonish important
When provisioning the cluster, the above 2 variables must set to `false`.
```

6. Create the clusters by running Terraform:

```bash,editable
terraform init
terraform plan
terraform apply
```

7. After Terraform has finished the apply operation, it will output a convenient SSH command you can copy. This command will allow you to ssh to the operator host. 

```admonish tip
The operator host is created in the Admin region only.
```

### Set up kubeconfig

You will now generate the installation script.

1. Configure the following input variables:

```terraform,editable
get_kubeconfigs = true
install_verrazzano = true
```

2. Configure the Verrazzano profile:

```terraform,editable
verrazzano_profile = "prod"
```

```admonish
Regardless of what you set the profile value to be, the profile of managed servers will always be `managed-cluster`.
```

3. If you need to use your own DNS, you need to configure DNS before you run Terraform and the installation scripts. Else, the installation scripts will use nip.io.

4. Run Terraform again:
```
terraform init
terraform plan
terraform apply
```

```admonish tip
Running `terraform apply` again will configure access to the clusters, give them a friendly name and upload the installation scripts to the operator host.
```

5. ssh to the operator host using the convenience command printed by Terraform.

`ssh -i /path/to/ssh_private_key -J opc@xyz.xyz.xyz.xyz opc@abc.abc.abc.abc"`

6. Verify you can reach the clusters e.g.

```bash, editable
for cluster in admin phoenix ; do
  kubectx $cluster
  kubectl get nodes
done
```

```admonish tip
Each cluster's context are renamed to a friendlier format, usually the name of the region except for the Admin cluster which is "admin".

To change context to your desired cluster, use the `kubectx` command e.g.

`kubectx phoenix`
```

7. You should be able to see something like the following:

```admonish success
```

```bash
    ✔ Switched to context "admin".
    NAME          STATUS   ROLES   AGE   VERSION
    10.0.123.29   Ready    node    91m   v1.24.1
    ✔ Switched to context "phoenix".
    NAME            STATUS   ROLES   AGE   VERSION
    10.31.101.163   Ready    node    89m   v1.24.1
    10.31.84.171    Ready    node    89m   v1.24.1
```

### Install Verrrazzano

You will now install Verrazzano in all clusters and register the managed clusters with the Admin cluster.

1. Install the Verrazzano Platform Operator:

```bash,editable
cd /home/opc/vz/operator

for cluster in admin phoenix ; do
  bash install_vz_operator_$cluster.sh
done
```

```admonish tip
Replace phoenix with a list of your clusters e.g.

`for cluster in admin sanjose chicago ;...`
```

2. Check if the operator has installed successfully in all clusters:

```bash, editable
for cluster in admin phoenix; do
  bash check_vz_operator_$cluster.sh
done
```

3. Obtain the manifest for DNS:

```bash
cd /home/opc/vz/oci
bash  get_oci_secret.sh
echo >> oci.yaml
```

4. Create the secret in each cluster:

```bash, editable
for cluster in admin phoenix ; do
  bash create_oci_secret_$cluster.sh
done
```

5. If you are using Thanos, configure your secret for OCI Object Storage now. For each enabled cluster, a storage file is created. Edit them and enter the following and create a secret:

  - compartment_ocid
  - region
  - tenancy_ocid
  - user_ocid
  - fingerprint
  - and the private key

```
cd /home/opc/vz/clusters
for cluster in admin phoenix; do
  kubectx $cluster
  kubectl create namespace verrazzano-monitoring
  kubectl create secret generic objstore-config -n verrazzano-monitoring --from-file=objstore.yml=thanos_$cluster_storage.yaml
done

```  

6. Install the Verrazzano Admin cluster:

```
cd /home/opc/vz/clusters
bash install_vz_cluster_admin.sh
```
```admonish info
The Admin cluster has more components to install and takes longer, so we install it separately. This allows us to install the managed clusters in parallel.
```

7. While the Admin cluster is being installed in the background, you can install the managed clusters in parallel:

```bash, editable
cd /home/opc/vz/clusters
for cluster in phoenix ; do
  bash install_vz_cluster_$cluster.sh
done
```

8. Wait for Verrazzano to be installed in all clusters:

```
# check managed clusters' status
bash vz_status.sh

# Admin cluster takes longer, check separately
kubectx admin
kubectl wait --timeout=20m --for=condition=InstallComplete verrazzano/admin
```

9. Create the certificates secrets for each managed cluster:

```bash, editable
cd /home/opc/vz/certs
for cluster in phoenix; do
  bash create_cert_secret_$cluster.sh
done
```

10. Create the ConfigMap for the API Server:

```
cd /home/opc/vz/cm
bash create_api_cm.sh
```

11. Create the Verrazzano managed cluster objects for each managed cluster:    

```bash, editable
cd /home/opc/vz/clusters
for cluster in phoenix; do
  bash create_vmc_$cluster.sh
done
```

12. Register all the managed clusters:

```bash, editable
for cluster in phoenix; do
  bash register_vmc_$cluster.sh
done
```
