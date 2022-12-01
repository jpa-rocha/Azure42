param uniqueName string

param location string
param functionApps array
param storageName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' existing = {
  name: storageName
}

resource host 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'host${uniqueName}'
  location: location
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
  }
}

resource site 'Microsoft.Web/sites@2022-03-01' = [for name in functionApps: {
  name: name
  location: location
  kind: 'functionapp'
  properties: {
    httpsOnly: true
    serverFarmId: host.id
    clientAffinityEnabled: true
    siteConfig: {
      appSettings: [
      {
        name: 'FUNCTIONS_WORKER_RUNTIME'
        value: 'dotnet'
      }
      {
        name: 'AzureWebJobsStorage'
        value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccount.listKeys().keys[0].value}'
      }
      {
        name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
        value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccount.listKeys().keys[0].value}'
      }
      {
        name: 'WEBSITE_CONTENTSHARE'
        value: toLower('site${uniqueName}')
      }]
    }
  }
}]
