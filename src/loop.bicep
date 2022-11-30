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
param names array
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = [for name in names :{
/*   parent: ATeamblobService */
  name: '${path}/default/${name}'
  properties: {
  publicAccess: 'None'
   metadata: {}
  }
}]
