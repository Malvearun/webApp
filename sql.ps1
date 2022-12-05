# change the DTU of a SQL database

$connectionName = "AzureRunAsConnection" #connectionName need to be reference
try
{
    # Get the connection "AzureRunAsConnection "
    $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName 
    write-output  $servicePrincipalConnection       

    "Logging in to Azure..."
    Connect-AzAccount `
        -ServicePrincipal `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
}
catch {
    if (!$servicePrincipalConnection)
    {
        $ErrorMessage = "Connection $connectionName not found."
        throw $ErrorMessage
    } else{
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
}


# Second method to run the command line util:

# Set-AzSqlDatabase -ResourceGroupName "<resource-group-name>"  `
#      -DatabaseName "<database-name>" -ServerName "<server-name>"  `
#      -Edition "Standard" -RequestedServiceObjectiveName "S0"
