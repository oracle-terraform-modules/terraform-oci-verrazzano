# Thanos

Verrazzano includes Thanos, an open source CNCF-projet that provides the following features:

- Global Query across multiple clusters
- Cheap, long time metrics storage using Object Storage
- Downsampling and compaction
- A Prometheus-compatible API

## Configuring Thanos

Configure the following parameters to use Thanos:

``` yaml, editable
prometheus            = true

prometheus_operator   = true

thanos = {
  bucket           = "vzthanos"
  bucket_namespace = "<replace-me>" 
  enabled          = "true"
  integration      = "sidecar"
  storage_gateway  = "true"
}  
```

When the above is configured, they will be generated and added to the Custom Resource of each Verrazzano instance.

## Configuring OCI Authentication

### User principal

1. For each cluster, use the following to configure your user principal authentication for Thanos:

``` yaml, editable
{{#include ../../../modules/verrazzano/resources/thanos-storage.yaml.example:1:}}
```
2. Save the file as storage.yaml

```admonish important
If you are using multiple clusters and your clusters are in different regions, ensure:

1. each cluster has its own storage configuration
2. you replace the region value in the region parameter above
```

### Instance principal

TODO

## Create the secret

Before enabling Thanos, ensure the following secret is created:

``` bash
kubectl create namespace verrazzano-monitoring
kubectl create secret generic objstore-config -n verrazzano-monitoring --from-file=objstore.yml=storage.yaml
```

You can now enable Thanos.