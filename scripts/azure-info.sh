#!/bin/sh

# get vnet id
VNETID=$(az network vnet show --resource-group ms-onemedia-rg --name caf-vnet --query id -o tsv)

# get subnet id
SUBNET=$(az network vnet subnet show --resource-group ms-onemedia-rg --vnet-name caf-vnet --name aks-subnet --query id -o tsv)

# get lates aks in your region of choice

VERSION=$(az aks get-versions -l NorthEurope --query 'orchestrators[-1].orchestratorVersion' -o tsv)


# Get access to your AKS Cluster 
az aks get-credentials --name yourclusername --resource-group yourazresourcegroup





