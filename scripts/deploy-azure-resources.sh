#!/bin/sh

az group deployment create \
  --name AKSDeployment \
  --resource-group msmelon-caf-rg \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json

