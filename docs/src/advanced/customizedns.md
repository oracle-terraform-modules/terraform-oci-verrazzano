# Customize DNS

<!-- toc -->

### Using a free Wildcar DNS (nip.io)

By default, Verrazzano and this module is configured to use nip.io:

```
configure_dns         = false
```

By setting the above to false, this ensures nip.io will be used.

### Using OCI DNS with API key

This assumes the DNS Zone has already been created and configured in OCI.

1. Create a file `oci.yaml` and enter the following:

   ```yaml,editable
   auth:
   region: us-phoenix-1
   tenancy: ocid1.tenancy.oc1.
   user: ocid1.user.oc1..
   key: |
     -----BEGIN RSA PRIVATE KEY-----
     abcdeefghijklmnopqrstuvwxyz1234567890+/==
     -----END RSA PRIVATE KEY-----
   fingerprint: 01:2a:3b:45:6c:78:9d:ee:0f
   ```
```admonish warning
The above user should have permission to manage the DNS Zone.
```

2. Store the authentication information in an OCI Secret in Vault. Note down the Secret OCID.

3. Before generating the Verrazzano installation scripts, configure DNS Parameters after the cluster creation:

```
configure_dns      = true

dns_compartment_id = "ocid1.compartment.oc1.."
dns_secret_id      = "ocid1.vaultsecret.oc1.."
dns_zone_id        = "ocid1.dns-zone.oc1.."
dns_zone_name      = "my.domain"

```
4. Run Terraform again to generate the scripts and templates:

```
terraform apply
```

### Using OCI DNS with instance_principal