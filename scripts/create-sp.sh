#!/bin/sh


az ad sp create-for-rbac --name aksspcaf


## Sample output as follows : 
##{
##  "appId": "c496cc6b-290d-4d72-bf71-fbd05e3cb10d",
## "displayName": "aksspcaf",
## "name": "http://aksspcaf",
## "password": "cbd578f8-9625-4f17-9313-19fb5f6e7113",
## "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"
##}

# To get a list of scripts under your management
az ad sp list --show-mine --query "[].{id:appId, name:appDisplayName, tenant:appOwnerTenantId, objectId: objectId}"

# show details of a specific sp
az ad sp show --id c496cc6b-290d-4d72-bf71-fbd05e3cb10d

# ref doc : https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest