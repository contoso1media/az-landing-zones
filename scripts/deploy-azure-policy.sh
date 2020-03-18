#!/bin/sh

az policy definition create --name 'add-resourcegroup-tag' --display-name 'Add a tag to resource groups' --description 'Adds the specified tag and value when any resource group missing this tag is created or updated. Existing resource groups can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed.' --rules 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/Tags/add-resourcegroup-tag/azurepolicy.rules.json' --params 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/Tags/add-resourcegroup-tag/azurepolicy.parameters.json' --mode All

az policy assignment create --name <assignmentname> --scope <scope> --policy "add-resourcegroup-tag" --params "{'tagName':{'value': 'myTag'}, 'tagValue':{'value': 'myValue'}}"