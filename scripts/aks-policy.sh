#!/bin/sh

# get your AKS onboard the Azure Policy
az aks enable-addons --addons azure-policy --name MyAKSCluster --resource-group MyResourceGroup

# build-in policy https://docs.microsoft.com/en-us/azure/governance/policy/concepts/rego-for-aks#built-in-policies
#az aks disable-addons --addons azure-policy --name MyAKSCluster --resource-group MyResourceGroup



# want to work with AZ Blueprints 
# https://github.com/Azure/azure-blueprints/tree/master/samples