#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

envsubst < capi-secret.yaml | kubectl apply -f -