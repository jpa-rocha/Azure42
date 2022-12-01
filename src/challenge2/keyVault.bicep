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
  }
}

resource secrets 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = [for secret in secretIDs: {
  name: secret.name
  parent: keyVault
  properties: {
    value: secret.secret
  }
}]
