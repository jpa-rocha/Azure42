param name string
param location string

resource computerVision 'Microsoft.CognitiveServices/accounts@2022-10-01' = {
  name: name
  location: location
  kind: 'ComputerVision'
  sku: {
    name: 'S1'
  }
  properties: {
    restore: false
  }
}
