var rand_string = uniqueString(resourceGroup().id)
//var storageName = 'stor${rand_string}'
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


resource ATeamStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'krkuryurkkrkkrykyu'
  location: locations
  sku: {
    name: globalRedundancy ? 'Standard_GRS' : 'Standard_LRS' 
  }
  kind: 'StorageV2'
}

resource ATeamblobService 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = { 
  parent: ATeamStorage
  name: 'default'
}


/* resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = {
  parent: ATeamblobService
  name: 'default'
  properties: {
    publicAccess: 'None'
    metadata: {}
  }
} */


output ATeamStorageId string = ATeamStorage.id
output ATeamStorageName string = ATeamStorage.name
output ATeamBlobServiceUrl string = ATeamStorage.properties.primaryEndpoints.blob
