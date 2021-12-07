#!/bin/bash
# Copyright 2017, 2021 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

echo "Installing Verrazzano"

if [[ ${verrazzano_type} = "admin" ]]
then
  sed -i -e "s?profile: dev?profile: prod?g" verrazzano.yaml
  echo "profile type set to prod for an admin cluster"
elif [[ ${verrazzano_type} = "dev" ]]
then
  echo "profile type set to dev for a dev cluster"
elif [[ ${verrazzano_type} = "managed" ]]
then
  sed -i -e "s?profile: dev?profile: managed?g" verrazzano.yaml
  echo "profile type set to managed for a managed cluster"
else
  sed -i -e "s?profile: dev?profile: prod?g" verrazzano.yaml
  echo "profile type set to prod for a custom cluster cluster"
fi

sed -i -e "s?example-verrazzano?${verrazzano_name}?g" verrazzano.yaml

kubectl apply -f verrazzano.yaml