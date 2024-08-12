## import web server instance to powershell
Import-Module -Name "C:\Program Files\Microsoft Dynamics 365 Business Central\240\Web Client\Modules\NAVWebClientManagement\NAVWebClientManagement.psm1"
## check it
Get-NAVWebServerInstance


```

WebServerInstance            : BC240
Website                      : Microsoft Dynamics 365 Business Central Web Client
Uri                          : http://DESKTOP-9I7BK02:8080/BC240
SiteDeploymentType           : SubSite
Configuration File           : C:\inetpub\wwwroot\BC240\navsettings.json
ClientServicesPort           : 7085
ManagementServicesPort       : 7045
ClientServicesCredentialType : Windows
DnsIdentity                  :
Server                       : localhost
ServerInstance               : BC240
Version                      : 24.0.18037.0

```

https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/deployment/configure-multiple-web-server-instances#GetStartedWebServerCmdlets


## RootSite
New-NAVWebServerInstance -WebServerInstance MyBCWebsite -Server MyBCServer -ServerInstance MyBCServerInstance -SiteDeploymentType RootSite -WebSitePort 8081 -PublishFolder "C:\Web Client\WebPublish"

## SubSite
New-NAVWebServerInstance -WebServerInstance MyWebApp -Server MyBCServer -ServerInstance MyBCServerInstance -SiteDeploymentType Subsite -ContainerSiteName MySiteContainer -WebSitePort 8081 -PublishFolder "C:\WebClient\WebPublish"

New-NAVWebServerInstance -WebServerInstance MyWebApp -Server DESKTOP-9I7BK02 -ServerInstance BC240 -SiteDeploymentType Subsite -ContainerSiteName MySiteContainer -WebSitePort 8081 


## DeveloperServicesEnabled: CustomSettings.config 175
C:\Program Files\Microsoft Dynamics 365 Business Central\240\Service 

<add key="DeveloperServicesEnabled" value="true" />

## DeveloperServicesPort:
<add key="DeveloperServicesPort" value="7049" />


## Stop services
net stop "Microsoft Dynamics 365 Business Central Server [BC240]"
net stop "Microsoft Dynamics 365 Business Central Web Client"

Stop-Service -Name 'MicrosoftDynamicsNavServer$BC240'
Stop-Service -Name 'MicrosoftDynamicsNavWebClient'


### Restart the Services:
Restart-Service -Name 'MicrosoftDynamicsNavServer$BC240'
Restart-Service -Name 'MicrosoftDynamicsNavWebClient'



net start "Microsoft Dynamics 365 Business Central Server [BC240]"



sc start "Microsoft Dynamics 365 Business Central Server [BC240]"

## Download Symbols

[2024-08-12 11:28:17.81] Using reference symbols cache paths: [c:\Users\Felix Omundi Nyagaka\Desktop\wsl\go\.alpackages]
[2024-08-12 11:28:17.82] Sending request to http://desktop-9i7bk02:7049/BC240/dev/metadata?tenant=default
[2024-08-12 11:28:18.37] Sending request to http://desktop-9i7bk02:7049/BC240/dev/packages?publisher=Microsoft&appName=Application&versionText=24.0.0.0&appId=00000000-0000-0000-0000-000000000000&tenant=default
[2024-08-12 11:28:18.38] Sending request to http://desktop-9i7bk02:7049/BC240/dev/packages?publisher=Microsoft&appName=System&versionText=1.0.0.0&appId=8874ed3a-0643-4247-9ced-7a7002f7135d&tenant=default
[2024-08-12 11:28:23.47] The following dependencies will be queried for propagated dependencies:
System Application by Microsoft (24.0.0.0)
Business Foundation by Microsoft (24.0.0.0)
Base Application by Microsoft (24.0.0.0)
[2024-08-12 11:28:23.47] Sending request to http://desktop-9i7bk02:7049/BC240/dev/packages?publisher=Microsoft&appName=System Application&versionText=24.0.0.0&appId=63ca2fa4-4f03-4f2b-a480-172fef340d3f&tenant=default
[2024-08-12 11:28:23.48] Sending request to http://desktop-9i7bk02:7049/BC240/dev/packages?publisher=Microsoft&appName=Business Foundation&versionText=24.0.0.0&appId=f3552374-a1f2-4356-848e-196002525837&tenant=default
[2024-08-12 11:28:23.48] Sending request to http://desktop-9i7bk02:7049/BC240/dev/packages?publisher=Microsoft&appName=Base Application&versionText=24.0.0.0&appId=437dbf0e-84ff-417a-965d-ed2bb9650972&tenant=default
[2024-08-12 11:28:25.17] All reference symbols have been downloaded.



## Build the Extension | AL Project
AL: Package

## Publish the Extension
AL: Publish


## syncronize database schema
Sync-NAVTenant -ServerInstance BC240 -Tenant 'default' -Force

## Install BcContainerHelper Module
Install-Module -Name BcContainerHelper -Scope CurrentUser


## For Business Central on-premises (BC18 and later), use the BCContainerHelper module
Import-Module 'BCContainerHelper'

## access link
http://localhost:8080/BC240/?company=CRONUS%20USA%2C%20Inc.&tenant=default&sk=W_EBB5iE9Q3ITDWVWmR1DQ&page=50101&dc=0&bookmark=C_tcMAAACHAQ