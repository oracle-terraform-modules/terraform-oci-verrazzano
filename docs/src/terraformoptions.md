# Terraform Options

<!-- toc -->
### Provider

| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| api_fingerprint | Fingerprint of the API private key to use with OCI API. | string | "" |
| api_private_key_path | The path to the OCI API private key. | string | "" |
| home_region | The tenancy's home region. | string | "" |
| tenancy_id | The tenancy id of the OCI Cloud Account in which to create the resources. | string | "" |
| user_id | The id of the user that terraform will use to create the resources. | string | "" |

### General OCI Parameters

| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| compartment_id | The compartment id where to create all resources. | string | "" |
| label_prefix | A string that will be prepended to all resources. | string | "" |

### SSH keys

| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| ssh_private_key_path | The path to ssh private key. | string | "none" |
| ssh_public_key_path | The path to ssh public key. | string | "none" |

### Networking

| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| cidrs | A map of cidrs for vcns, pods and services for each region | map(any)| |
| connectivity_mode | Whether to keep set up connectivity in mesh or star mode. Admin is always connected to everybody | string | star |


### Kubernetes Clusters

| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| admin_region | The region parameters of the Admin cluster. In case a single cluster is created, the Admin region is used for the single cluster. | map(any)| |
| kubernetes_version | The version of Kubernetes to use. | string | v1.24.1 |
| oke_control_plane | Whether to keep all OKE control planes public or private | public/private | public |
| managed_clusters | A map of OCI regions where managed clusters will be created | map(bool) |  |
| nodepools | Node pool specification for all clusters | map(bool) |  |
| cloudinit_nodepool_common | Path to custom cloud init file for OKE workner nodes | string |  |

### Verrazzano

| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| get_kubeconfigs | Whether to set up access to the clusters. Set to false on cluster creation. | bool | false |
| install_verrazzano | Whether ready to install Verrazzano. Set to false on cluster creation | string | false |
| verrazzano_version | Verrazzano version to install | 1.5.3 | 1.5.3 |
| verrazzano_profile | Verrazzano profile to install | dev/prod | dev |
| verrazzano_control_plane | Whether to keep all Verrazzano control planes public or private | public/private | public |
| verrazzano_data_plane | Whether to keep all Verrazzano data planes public or private | public/private | public |
| verrazzano_load_balancer | OCI Load Balancer Shape | map(string) |  |

### Verrazzano Components
| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| argocd    | Whether to install ArgoCD | bool | true |
| coherence    | Whether to install Coherence Operator | bool | false |
| configure_dns    | Whether to configure DNS. If not configured, nip.io will be used | bool | false |
| console    | Whether to install Verrazzano console | bool | false |
| fluentd    | Whether to install fluentd | bool | true |
| grafana    | Whether to install Grafana | bool | true |
| jaeger    | Whether to install Jaeger | bool | true |
| kiali    | Whether to install Kiali | bool | true |
| kube_state_metrics    | Whether to capture Kube State Metrics | bool | false |
| opensearch    | Whether to install OpenSearch | bool | true |
| opensearch_dashboards    | Whether to install OpenSearch Dashboards | bool | true |
| prometheus    | Whether to create an instance of Prometheus | bool | true |
| prometheus_operator    | Whether to install the Prometheus Operator | bool | true |
| rancher    | Whether to install Rancher | bool | true |
| velero    | Whether to install Velero | bool | false |
| weblogic_operator    | Whether to install WebLogic Operator | bool | false |

### DNS

| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| dns_compartment_id | DNS Zone's Compartment id | string |  |
| dns_zone_id | DNS Zone OCID in OCI DNS | string |  |
| dns_zone_name | DNS Zone Name | string |  |
| dns_secret_id | OCID of OCI secret to be used for OCI DNS authentication. | string |  |

### Service mesh

| Parameter | Description | Type        | Default |
| --------- | ----------- | ----------- | ------- |
| mesh_id | The name of the mesh to use | string |  |
