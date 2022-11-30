@allowed ([
  'westeurope'
  'eastus'
])
param locations string
param globalRedundancy bool
module ATeamStorageModule '../src/main.bicep' = {
  name: 'storageName'
  params: {
    globalRedundancy: globalRedundancy
    locations: locations
  }
}
