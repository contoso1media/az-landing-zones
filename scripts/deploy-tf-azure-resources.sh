#!/bin/sh

# az cloud set --name AzureChinaCloud|AzureGermanCloud|AzureUSGovernment

export ARM_USE_MSI=true
export ARM_SUBSCRIPTION_ID=xxxxxxxx
export ARM_CLIENT_ID=xxxxxxx
export ARM_CLIENT_SECRET=xxxxxxx
export ARM_TENANT_ID=xxxxxxxx

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your_subscription_id"

## Storage account creation 
az storage account create --name caftfstatesa --resource-group ms-onemedia-rg -l westeurope --sku Standard_LRS

## get account key 
KEY=$(az storage account keys list --account-name caftfstatesa --query '[0].value')
echo $KEY

az storage container create -n tfstate --account-name caftfstatesa --account-key $KEY

## IMPORTANT! terraform init first 

terraform plan -var "client_id=your_client_id" -var "client_secret=your_client_secret" -out run.plan

terraform apply "run.plan"          

echo "$(terraform output kube_config)" > ~/.kube/azurek8s

export KUBECONFIG=~/.kube/azurek8s