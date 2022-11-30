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
module ATeamStorageModule '../src/main.bicep' = {
  name: 'krkuryurkkrkkrykyu'
  params: {
    globalRedundancy: globalRedundancy
    locations: locations
  }
}

module ATeamVMModule 'vm.bicep' = {
  name: 'VMkrkuryurkkrkkrykyu'
  params: {
    name: 'VMkrkuryurkkrkkrykyu'
    location: locations
    adminName: 'admin'
    password: keyVault.getSecret('adminPassword')
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
