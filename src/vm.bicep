@secure()
param password string

param location string

param name string

param adminName string

resource greatVMpeartor 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: name
  location: location
  properties: {
    osProfile: {
      adminPassword: password
      adminUsername: adminName
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
    }
    hardwareProfile: {
      vmSize: 'Standard_B1ls'
    }
    networkProfile: {
      networkInterfaces: [{
        id: nic.id
      }]
    }
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: 'nic${name}'
  location: location
  properties: {
    ipConfigurations: [{
      name: 'ipconfig1'
      properties: {
        publicIPAddress: {
          id: publicIP.id
        }
      }
    }]
  }
}

resource publicIP 'Microsoft.Network/publicIPAddresses@2022-05-01' = {
  name: 'pip${name}'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    publicIPAddressVersion: 'IPv4'
    idleTimeoutInMinutes: 4
  }
}

