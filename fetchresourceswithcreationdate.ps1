Connect-AzAccount
$sub='yoursubscriptionid'
$resourcegroups=get-azresourcegroup
$uri="https://management.azure.com/subscriptions/$sub/resources"+"?api-version=2023-07-01&`$expand=createdTime,changedTime"
$x=Invoke-AzRestmethod -uri $uri -Method Get
$($x.Content | convertfrom-json).value | export-csv c:\temp\$sub-inventory.csv -NoTypeInformation
