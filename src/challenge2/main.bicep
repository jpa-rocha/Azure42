var uniqueName = uniqueString(resourceGroup().id)

param location string = resourceGroup().location

param tenantID string = subscription().tenantId

var keyVaultID = 'kv${uniqueName}'
var cvName = 'cv${uniqueName}'
var eventGridName = 'evt${uniqueName}'
var dbName = 'db${uniqueName}'

module storage 'storage.bicep' = {
  name: 'sto${uniqueName}'
  params: {
    location: location
    accountName: 'sto${uniqueName}'
    containerNames: ['images', 'export']
  }
}

module eventGrid 'event_grid.bicep' = {
  name: eventGridName
  params: {
    location: location
    name: eventGridName
  }
}

module functions 'functions.bicep' = {
  name: 'func${uniqueName}'
  params: {
    uniqueName: uniqueName
    location: location
    functionApps: [{
      name: 'App${uniqueName}'
      runtime: 'dotnet'
      }
      {
        name: 'Events${uniqueName}'
        runtime: 'nodejs'
      }]
    storageName: storage.name
  }
}

module database 'database.bicep' = {
  name: dbName
  params: {
    name: dbName
    location: location
  }
}

module computerVision 'cv.bicep' = {
  name: cvName
  params: {
    name: cvName
    location: location
  }
}

module keyVault 'keyVault.bicep' = {
  name: keyVaultID
  params: {
    location: location
    tenantID: tenantID
    keyVaultID: keyVaultID
    secretIDs: [{
      name: 'computerVisionApiKey'
      secret: cv.listKeys().key1
    }
    {
      name: 'eventGridTopicKey'
      secret: evntGrd.listKeys().key1
    }
    {
      name: 'cosmosDBAuthorizationKey'
      secret: db.listKeys().primaryMasterKey
    }
    {
      name: 'blobStorageConnection'
      secret: storage.outputs.entryPoint
    }]
  }
}

resource evntGrd 'Microsoft.EventGrid/topics@2022-06-15' existing = {
  name: eventGridName
}

resource cv 'Microsoft.CognitiveServices/accounts@2022-10-01' existing = {
  name: cvName
}

resource db 'Microsoft.DocumentDB/databaseAccounts@2022-08-15' existing = {
  name: dbName
}
