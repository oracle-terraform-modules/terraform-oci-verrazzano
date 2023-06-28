# Data plane

The data plane is where the workload are run. This is usually done as part of the service mesh (Istio). 

Istio usually has an ingress gateway that allows incoming traffic into the mesh.

On OCI, the service mesh is front-ended by an OCI Load Balancer and Istio's ingress gateway.
the ingress gateway is front-ended by an OCI Load Balancer. As such a number of configuration options are possible depending on the use case:

1. access: the control plane can be made public or private. By default, it is public.
2. shape: the load balancer shape can be configured including the bandwidth, security posture
3. DNS: the domain used to access the control plane services

Depending on the values you choose, your architecture and possibly other requirements, additional configuration may be necessary.

The following parameters configures the Verrazzano control plane:

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| verrazzano_data_plane | Determines whether the load balancer used to access the control plane is public or private. | public | 
| verrazzano_load_balancer | Determines the shape of the load balancer | <pre>verrazzano_load_balancer = {<br>  shape    = "10Mbps"<br>  flex_min = "50"<br>  flex_max = "100" <br>}</pre>|
