param containers array
param storageLocation string = 'westeurope'


module storageModule 'main.bicep' = {
  params: {
    name: 
    globalRedundancy: false
    storageLocation: storageLocation
  }
}

var moduleName = storageModule.outputs.storageAccountName

resource storageArray 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = [for names in containers: {
  name: '${moduleName}/default/${names}'
}]
