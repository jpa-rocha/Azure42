param name string

param location string

resource eventGrid 'Microsoft.EventGrid/topics@2022-06-15' = {
  name: name
  location: location
  properties: {
    inputSchema: 'EventGridSchema'
  }
}
