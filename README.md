# What The Hack: Infrastructure As Code with Bicep

## Introduction

DevOps is a journey not a destination. Implementing Infrastructure-as-Code is one of the first steps you will need to take!

When implementing an application environment in the cloud, it is important to have a repeatable way to deploy the underlying infrastructure components as well as your software into the target environment.  This includes resources such as:
- Virtual Networks, Network Security Groups (Firewalls), Public IPs, Virtual Machines, Storage (Disks)
- PaaS Services (Azure SQL, App Service, etc)
- Configuration Management (installing & configuring software on VMs)

The best way to make deployments repeatable is to define them with code, hence the term "Infrastructure as Code" (aka IAC).  There are multiple technologies that enable you to achieve this. Some of these include:
- ARM Templates with JSON
- ARM Templates with Bicep
- PowerShell Desired State Configuration (DSC)
- HashiCorp's Terraform & Packer
- Ansible, Chef, Puppet, Salt Stack, and others

This hack is focused on using Bicep to implement your IaC. It does not mean this is the only way to implement IaC, it's just one of many ways. If you want to learn how to do IaC in Azure with other technologies, try one of our other IaC hacks for [ARM Templates & PowerShell DSC](), [Terraform]() or [Ansible]().

## Learning Objectives

This hack will help you learn:
- How ARM Templates with Bicep can be used to deploy Azure infrastructure

The challenges build upon each other incrementally. You will start by creating a basic Bicep template to get you familiar with the tools & syntax.  Then you extend your template incrementally to deploy multiple infrastructure resources to Azure.

### Challenges

- Challenge 0: **[Pre-Requisites - Ready, Set, Go!](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-00.md?csf=1&web=1&e=WSBp7P)**
   - Prepare your workstation to work with Azure
- Challenge 1: **[Basic Bicep](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-01.md?csf=1&web=1&e=tgmZWd)**
   - Develop a simple Bicep file that takes inputs to create an Azure Storage Account, and returns outputs
- Challenge 2: **[Bicep expressions and referencing resources](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-02.md?csf=1&web=1&e=5xTtQ1)**
   - Learn Bicep expressions and referencing resources
- Challenge 3: **[Advanced resource declarations](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-03.md?csf=1&web=1&e=9lpT3Q)**
   - Advanced resource declarations
- Challenge 4: **[Secret Values with Azure Key Vault](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-04.md?csf=1&web=1&e=rA1wsX)**
   - Learn how NOT to lose your job!
- Challenge 5: **[Deploy a Virtual Machine](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-05.md?csf=1&web=1&e=p2xoXR)**
   - Create complex deployment with multiple dependencies
- Challenge 6: **[Bicep Modules](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-06.md?csf=1&web=1&e=GhafPn)**
   - Learn how create resusable modules for granular resource management
- Challenge 7: **[Configure VM to run a Web Server](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-07.md?csf=1&web=1&e=S6gnTa)**
   - Learn about custom script extensions
- Challenge 8: **[Deploy a Virtual Machine Scale Set](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-08.md?csf=1&web=1&e=yX6E6w)**
   - Create complex deployment with Bicep using modules
- Challenge 9: **[Configure VM Scale Set to run a Web Server](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-09.md?csf=1&web=1&e=ezjeWJ)**
   - Learn about custom script extensions with VM Scale Sets
- Challenge 10: **[Configure VM Scale Set to run a Web Server using cloud-init](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-10.md?csf=1&web=1&e=S8oYbJ)**
   - How cloud-init scripts can be run on a Virtual Machine Scale Set (VMSS)
- Challenge 11: **[Deploy resources to different scopes](https://microsofteur.sharepoint.com/:t:/r/teams/42Wolfsburg-AzureDevCamp-Nov2022/Shared%20Documents/General/Challenge%201/Bicep-Challenge-11.md?csf=1&web=1&e=y5UVca)**
   - Learn how to deploy resources to different scopes   


## Prerequisites

You will want to prepare your machine with the following to help complete the Challenges for this hack:

* Azure Subscription
* [Windows Subsystem for Linux (Windows 10-only)](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
* [PowerShell Cmdlets for Azure](https://docs.microsoft.com/en-us/powershell/azure/?view=azps-5.6.0)
* [Visual Studio Code](https://code.visualstudio.com/)
* Bicep plugins for VS Code
	* [Bicep VS Code Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep)
	* [Bicep CLI](https://github.com/Azure/bicep/blob/main/docs/installing.md)

## Repository Contents 
- `../Student`
  - Bicep challenges
- `../Student/Resources`
  - Shell scripts needed to complete the challenges

## Contributors

- Victor Viriya-ampanond
- William Salazar 
- Peter Laudati
- Pete Rodriguez
- Tim Sullivan
- Mark Garner
- Jesse Mrasek
- Andy Huang
