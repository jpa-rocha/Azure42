@allowed ([
  'westeurope'
  'eastus'
])
param locations string
param globalRedundancy bool
module ATeamStorageModule '../src/main.bicep' = {
  name: 'krkuryurkkrkkrykyu'
  params: {
    globalRedundancy: globalRedundancy
    locations: locations
  }
}

var path = ATeamStorageModule.name
param min int
param count int
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = [for i in range(min, count) :{
/*   parent: ATeamblobService */
  name: '${path}/default/container${i}'
  properties: {
  publicAccess: 'None'
   metadata: {}
  }
}]
