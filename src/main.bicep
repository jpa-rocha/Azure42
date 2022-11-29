var rand_string = uniqueString(resourceGroup().id)
var storageName = 'stor${rand_string}'
@allowed ([
  'westeurope'
  'eastus'
])
param locations string

resource ATeamStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: locations
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output ATeamStorage string = ATeamStorage.id
