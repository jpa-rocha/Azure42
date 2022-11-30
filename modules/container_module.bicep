@allowed ([
  'westeurope'
  'eastus'
])
param locations string
@description('Enter True for Standard_GRS, False for Standard_LRS')
@allowed ([
  true
  false
])
param globalRedundancy bool

module ATeamStorageModule '../src/storage.bicep' = {
  name: 'krkuryurkkrkkrykyu'
  params: {
    globalRedundancy: globalRedundancy
    locations: locations
  }
}

module ATeamVMModule '../src/vm.bicep' = {
  name: 'VMkrkuryurkkrkkrykyu'
  params: {
    vmName: 'VMkrkuryurkkrkkrykyu'
    location: locations
    adminUsername: 'admin'
    adminPasswordOrKey: keyVault.getSecret('adminPassword')
  }
}

var path = ATeamStorageModule.name
param count int
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = [for i in range(0, count) :{
/*   parent: ATeamblobService */
  name: '${path}/default/container${i}'
  properties: {
  publicAccess: 'None'
   metadata: {}
  }
}]

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' existing = {
  name: 'ateam-rg-KeyVault'
}
