param name string

param location string

resource account 'Microsoft.DocumentDB/databaseAccounts@2022-08-15' = {
  name: name
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [{
      locationName: location
    }]
  }
}


resource database 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2022-08-15' = {
  parent: account
  name: 'licenseplates'
  properties: {
    resource: {
      id: 'licenseplates'
    }
  }
}

resource containerProcessed 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2022-08-15' = {
  name: 'Processed'
  parent: database
  properties: {
    resource: {
      id: 'Processed'
      partitionKey: {
        paths: [
          '/licensePlateText'
        ]
      }
    }
  }
}

resource containerNeedReview 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2022-08-15' = {
  name: 'NeedsManualReview'
  parent: database
  properties: {
    resource: {
      id: 'NeedsManualReview'
      partitionKey: {
        paths: [
          '/filename'
        ]
      }
    }
  }
}
