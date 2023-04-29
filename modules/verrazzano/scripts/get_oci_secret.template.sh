#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

oci secrets secret-bundle get --secret-id "${secret_id}" | jq '[.data."secret-bundle-content"."content" ]' | tr -d "[ \" ]" | base64 -d > $HOME/vz/oci/oci.yaml

echo >> $HOME/vz/oci/oci.yaml