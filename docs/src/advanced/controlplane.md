# Control plane

Every Verrazzano cluster (whether with dev, prod or managed-cluster profile) has a control plane. This control plane allows a Verrazzano administrator to access the various admin services from outside the cluster through a load balancer. 

On OCI, the Verrazzano Control Plane is front-ended by an OCI Load Balancer and the ingress-nginx controller. As such a number of configuration options are possible depending on the use case:

1. access: the control plane can be made public or private. By default, it is public.
2. shape: the load balancer shape can be configured including the bandwidth, security posture
3. DNS: the domain used to access the control plane services

Depending on the values you choose, your architecture and possibly other requirements, additional configuration may be necessary.

The following parameters configures the Verrazzano control plane:

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| verrazzano_control_plane | Determines whether the load balancer used to access the control plane is public or private. | public | 
| verrazzano_load_balancer | Determines the shape of the load balancer | <pre>verrazzano_load_balancer = {<br>  shape    = "10Mbps"<br>  flex_min = "50"<br>  flex_max = "100" <br>}</pre>|
