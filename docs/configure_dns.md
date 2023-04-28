# Configure DNS

1. This assumes you have already configured a DNS Zone in OCI
2. Copy the oci.yaml.example to oci.yaml
3. Enter the corresponding data:

```
auth:
  region: us-ashburn-1
  tenancy: ocid1.tenancy.oc1..aaaa
  user: ocid1.user.oc1..aaa
  key: |
    -----BEGIN RSA PRIVATE KEY-----
    aaaa
    ....
    bbbb
    -----END RSA PRIVATE KEY-----
  fingerprint: 12:ab:34:cd:56:ef:78:ab:90:cd:
```
4. Save the file to an OCI Secret

5. Note the Secret's OCID