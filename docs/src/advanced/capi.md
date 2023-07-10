[uri-capi]: https://cluster-api.sigs.k8s.io/
# Cluster API

[Cluster API (CAPI)][uri-capi] is a Kubernetes sub-project that provides a set of declarative APIs and tooling to simplify managing the lifecycle of Kubernetes clusters on multiple infrastructure providers. CAPI is particularly useful when you have to provision clusters on multiple infrastructure providers.

CAPI has 2 type of clusters:

1. A management cluster: is a Kubernetes cluster that manages the lifecycle of Workload Clusters. A Management Cluster is also where one or more providers run, and where resources such as Machines are stored.

2. A workload cluster: is a Kubernetes cluster whose lifecycle is managed by a Management Cluster.

In Verrazzano, the management cluster is typically deployed in an "Admin" cluster. The workload clusters are equivalent to managed clusters.

You can use CAPI to provision clusters the following type of clusters:

- [OKE](./advanced.md/oke.md)
- [OCNE](./advanced.md/ocne.md)

To enable Cluster API, configure its parameter in `terraform.tfvars`:

``` yaml
cluster_api = true
```