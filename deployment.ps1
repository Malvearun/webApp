
[CmdletBinding()]
param (
    [string]$subscriptionId,
    [string]$RESOURCE_GROUP_NAME,
    [string]$RESOURCE_GROUP_LOCATION
)



function Get-LocationShort {
    $location = ((Get-AzResourceGroup).Location[0]).ToUpper()
    if ($location -ilike '*Australia*') {
        $locationinitials = "au"
        write-output $locationinitials
    }
    else {
        $locationinitials = 'UK'
        write-output $locationinitials
    }
}

# move to deployment subscription
Set-AzContext -subscriptionId $subscriptionId

$locationinitials = Get-LocationShort

if ($locationinitials -ilike "au") {
    az group create --name myResourceGroup --location $RESOURCE_GROUP_LOCATION && 
    az deployment group create --resource-group $RESOURCE_GROUP_NAME --template-file "$PSScriptRoot\webapp.bicep" -subscriptionId $subscriptionId 
    
}
