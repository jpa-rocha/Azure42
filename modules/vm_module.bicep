resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' existing = {
  name: 'ateam-rg-KeyVault'
}
@description('The name of you Virtual Machine.')
param vmName string = 'VM${uniqueString(resourceGroup().id)}'

@allowed ([
  'westeurope'
  'eastus'
])
param locations string
module VMCreationModule '../src/vm.bicep' = {
  name: vmName
  params: {
    location: locations
    adminPasswordOrKey: keyVault.getSecret('adminPassword')
  }
}
