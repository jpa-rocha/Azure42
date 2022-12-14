param location string = resourceGroup().location

param accountName string

param functionAccountNames array

param containerNames array

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: accountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource storageBlob 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = {
  name: 'default'
  parent: storageAccount
}


resource containers 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = [for name in containerNames: {
  name: name
  parent: storageBlob
}]

resource functionAccounts 'Microsoft.Storage/storageAccounts@2022-05-01' = [for name in functionAccountNames: {
  name: name
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}]

output entryPoint string = storageAccount.properties.primaryEndpoints.blob
