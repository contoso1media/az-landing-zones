$Subscription = Get-AzSubscription -SubscriptionName 'Subscription01'

$definition = New-AzPolicyDefinition -Name "add-resourcegroup-tag" -DisplayName "Add a tag to resource groups" -description "Adds the specified tag and value when any resource group missing this tag is created or updated. Existing resource groups can be remediated by triggering a remediation task. If the tag exists with a different value it will not be changed." -Policy 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/Tags/add-resourcegroup-tag/azurepolicy.rules.json' -Parameter 'https://raw.githubusercontent.com/Azure/azure-policy/master/samples/Tags/add-resourcegroup-tag/azurepolicy.parameters.json' -Mode All
$definition
$assignment = New-AzPolicyAssignment -Name resourcetag -Scope "/subscriptions/$($Subscription.Id)"  -tagName myenv -tagValue myproduction -PolicyDefinition $definition
$assignment 