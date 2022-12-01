param keyVaultID string
param location string
param tenantID string
param secretIDs array

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultID
  location: location
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: tenantID
    accessPolicies: [
      {
        tenantId: tenantID
        objectId: '27cc5320-d698-401d-9e87-e80ec9f31cb1'
        permissions: {
          keys: ['list']
          secrets: ['list']
        }
      }
    ]
  }
}

resource secrets 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = [for secret in secretIDs: {
  name: secret.name
  parent: keyVault
  properties: {
    value: secret.secret
  }
}]
