[uri-changelog]: https://github.com/oracle-terraform-modules/terraform-oci-verrazzano/blob/main/docs/CHANGELOG.md
[uri-docs]: https://oracle-terraform-modules.github.io/terraform-oci-verrazzano
[uri-terraform-oci-oke]: https://github.com/oracle-terraform-modules/terraform-oci-oke
[uri-verrazzano]: https://verrazzano.io
[uri-verrazzano-medium]: https://medium.com/verrazzano
[uri-verrazzano-slack]: https://bit.ly/3gOeRJn
[uri-verrazzano-youtube]: https://www.youtube.com/@verrazzano_io

## Introduction

This module automates the installation of the [Verrazzano Container Platform][uri-verrazzano] on top of the [terraform-oci-oke][uri-terraform-oci-oke] module. 

```admonish warning
This module is currently in technical preview. Your ideas and feedback are most welcome.
```

## News

***
### July 20: Announcing release v0.0.7

- added support for Thanos and Cluster API
- added Cluster API documentation
- upgrade oke module to 5.x branch

***
### June 28: Announcing release v0.0.6

- added documentation for private endpoints by @hyder in #18
- added customize dns documentation by @hyder in #19
- added architecture diagram for managed cluster, control plane by @hyder in #20
- updated admin templates for using nip.io by @hyder in #22
- added support for configuring the cni of admin and managed clusters by @hyder in #23

***
### June 9 2023: Announcing release v0.0.5

- Configurable Verrazzano components
- Multi-cluster mesh support
- Configurable DNS

***

### May 29 2023: Announcing release v0.0.4

- Input variable name changes
- Removed regions input variable
- Updated Terraform options in docs
- Updated terraform.tfvars.example file
- Updated services and pods CIDRs so there's no overlap

## Related Documentation

* [Verrazzano Documentation][uri-verrazzano]
* [Verrazzano on Medium][uri-verrazzano-medium]
* [Verrazzano on Slack][uri-verrazzano-slack]
* [Verrazzano on YouTube][uri-verrazzano-youtube]
* [Terraform module for OKE][uri-terraform-oci-oke]

## Changelog
View the [CHANGELOG][uri-changelog].

## Security
Please consult the [security guide](./docs/SECURITY.md) for our responsible security vulnerability disclosure process


## License
Copyright (c) 2019-2023 Oracle and/or its affiliates.

Released under the Universal Permissive License v1.0 as shown at
<https://oss.oracle.com/licenses/upl/>.
