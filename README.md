# Summary
1. Create a Bicep template that will deploy three Windows web apps to Azure, all to the same hosting plan. The hosting plan has already been deployed by a different template. One of the web apps should have its timezone set to Brisbane Australia. The web app segment of the template should be reusable by other templates.

Prerequisites/assumptions:

    A valid Azure subscription.
    PowerShell (command: Install-Module Az).
    The application to be deployed is a web application 
    For Bicep development in Visual Studio Code, install Microsoft Bicep extension.

1. Write a PowerShell Core script that uses Azure PowerShell. The script should change the DTU of a SQL database or elastic pool (your choice). The script will be called by an external system for different customers, so should be parameterised.

2. Write a YAML pipeline in Azure DevOps that deploys a Windows web app to Azure. The web app name and package filename should be parameterised.

# Pipelines

This is a simple Azure DevOps yaml structure pipeline with referenincing to GIT repo in Azure. 
1. Resource repo is reference to WebApp.
2. trigger is set to feature branch
3. variable path included.
4. Stage GetInfraArtifacts is to copy the files.
5. Stage ApproveRelease is set to manual trigger.
6. Stage Deploy-WebApp is to  install & implement the application in environment.
7. Stage ManualVerification-WebApp is to check the application is installed.
8. Stage CleanUp_WebApp.

# Validate the deployment

Browse to http://webAppName.azurewebsites.net/ and verify it’s been created.

# Author: Arun Malve

# Reference pages:
https://learn.microsoft.com/en-us/azure/app-service/provision-resource-bicep
https://learn.microsoft.com/en-us/azure/app-service/deploy-azure-pipelines?tabs=yaml
