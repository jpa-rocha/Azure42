param uniqueName string

param location string
param functionApps array


resource host 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'host${uniqueName}'
  location: location
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
  }
}

resource site 'Microsoft.Web/sites@2022-03-01' = [for func in functionApps: {
  name: func.name
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
        value: func.runtime
      }
      {
        name: 'AzureWebJobsStorage'
        value: 'DefaultEndpointsProtocol=https;AccountName=${func.storageName};EndpointSuffix=${environment().suffixes.storage};AccountKey=${func.storageKey}'
      }
      {
        name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
        value: 'DefaultEndpointsProtocol=https;AccountName=${func.storageName};EndpointSuffix=${environment().suffixes.storage};AccountKey=${func.storageKey}'
      }
      {
        name: 'WEBSITE_CONTENTSHARE'
        value: toLower('site${uniqueName}')
      }]
    }
  }
}]
