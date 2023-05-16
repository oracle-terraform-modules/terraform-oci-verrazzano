---
title: "With Private Endpoints"
date: 2023-05-04T18:04:17+10:00
draft: false
weight: 2
---

## Creating the clusters
1. Copy terraform.tfvars.example to terraform.tfvars
2. Provide values for the input variables `api_fingerprint`,`api_private_key_path`,`tenancy_id`,`user_id`, `compartment_id`.
3. Set your tenancy's home region using `home_region`.
4. Set the `control_plane_type = public`
5. Configure the admin region:
   - Set the Admin region for where you want to place the Verrazzano multi-cluster. This should be the region name only e.g. `Sydney`. This should not be the region identifier `ap-sydney-1`.
   - Also change the provider to its corresponding alias. The aliases can be found in providers.tf e.g. if you want to place your admin cluster in Ashburn, you'll change the provider from `oci.sydney` to `oci.ashburn`. This should be configured in `admin.tf` in the root module.
6. To create clusters in your preferred regions, set your preferred regions' values to `true` e.g. `ashburn=true` in the `clusters` parameter. Leave those that you do not use to false.
7. For the regions you enable, uncomment them in `output.tf` for `cluster_ids`, `int_nsg_ids` and `pub_nsg_ids`. For the clusters that you do not use, leave them commented.
8. Uncomment the respective clusters that you have enabled. The clusters are created in either {country, continent,region}.tf. e.g. Ashburn will be found in `usa.tf` under `modules\clusters`. Leave the clusters that you do not use as commented.
> We pre-create aliased providers. But in doing so, Terraform then wants to check all configured regions and this can take some time. Instead, we want Terraform apply to happen as quickly as possible. That's why comment/uncomment. We'll look for a way to improve this in the future.
9. For the first run, set `configure_clusters` and `install_vz` set to `false`. 
10. Run `terraform init` and `terraform  apply`.

## Configure connectivity with Remote Peering Connection

1. In OCI console, select your admin region and navigate to Networking > Dynamic Routing Gateway. Click on the admin drg.
2. Under Resources, click on Remote Peering Connections Attachments.
3. Under Remote Peering Connection, click on the Remote Peering Connection.
4. Copy the RPC OCID (in the right column). Do not mistake the RPC OCID for the DRG OCID which is also shown.
5. If your managed cluster is in another region, select the managed cluster's region. This will change the OCI Console page to Networking > Dynamic Routing Gateway.
6. Repeat steps 2-3. 
7. Click on "Establish Connection".
8. Select the region of the Admin cluster.
9. Paste the RPC OCID copied from Step 4 and click on "Establish Connection".
10. Wait for the Remote Peering to be established.

## Setting up kubeconfig

1. Once your admin and proposed managed clusters are created, set `configure_clusters` and `install_vz` set to `true` and run 'terraform apply` again to generate the installation scripts.

2. ssh to the operator host using the convenience command printed by Terraform.

`ssh -i /path/to/ssh_private_key -J opc@xyz.xyz.xyz.xyz opc@abc.abc.abc.abc"`

3. Verify you can reach the clusters e.g.

```
for cluster in admin sydney melbourne ; do
  kubectx $cluster
  kubectl get nodes
done
```

4. You should be able to see something like the following:

```
✔ Switched to context "admin".
NAME          STATUS   ROLES   AGE   VERSION
10.0.123.29   Ready    node    91m   v1.24.1
✔ Switched to context "sydney".
NAME            STATUS   ROLES   AGE   VERSION
10.24.101.163   Ready    node    89m   v1.24.1
10.24.84.171    Ready    node    89m   v1.24.1
✔ Switched to context "melbourne".
NAME          STATUS   ROLES   AGE   VERSION
10.23.92.70   Ready    node    92m   v1.24.1
```
## Install Verrrazzano

1. Install the Verrazzano operator:

```
cd /home/opc/vz/operator

for cluster in admin sydney melbourne ; do
  bash install_vz_operator_$cluster.sh
done
```

2. Check if the operator has installed sucessfully:

```
for cluster in admin sydney melbourne ; do
  bash check_vz_operator_$cluster.sh
done
```

3. Install the Verrazzano admin cluster:

```
cd /home/opc/vz/clusters
bash install_vz_cluster_admin.sh
```

4. While the admin cluster is being installed in the background, you can install the managed clusters in parallel:

```
for cluster in sydney melbourne ; do
  bash install_vz_cluster_$cluster.sh
done
```

5. Wait for Verrazzano to be installed in all clusters:

```
bash vz_status.sh

# Admin cluster takes longer, check separately
kubectx admin
kubectl wait --timeout=20m --for=condition=InstallComplete verrazzano/admin
```

6. Create the certificates secrets:
```
cd /home/opc/vz/certs
for cluster in sydney melbourne; do
  bash create_cert_secret_$cluster.sh
done
```

7. Create the ConfigMap for the API Server:

```
cd /home/opc/vz/cm
bash create_api_cm.sh
```

8. Create the Verrazzano managed cluster objects for each managed cluster:
    

```
cd /home/opc/vz/clusters
for cluster in sydney melbourne ; do
  bash create_vmc_$cluster.sh
done
```

9. Register all the managed clusters:

```
for cluster in sydney melbourne ; do
  bash register_vmc_$cluster.sh
done
```
