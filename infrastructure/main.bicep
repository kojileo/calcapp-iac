// App Service プランの作成
resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
    name: 'plan-rg-calc-test'
    location: 'Japan East'
    sku: {
      name: 'F1'
      tier: 'Free'
    }
  }
  
  // Web App (.NET 8) の作成
  resource webApp 'Microsoft.Web/sites@2022-09-01' = {
    name: 'calc-backend-test'
    location: 'Japan East'
    properties: {
      serverFarmId: appServicePlan.id
      siteConfig: {
        appSettings: [
          {
            name: 'WEBSITE_NODE_DEFAULT_VERSION'
            value: '~18'
          }
        ]
        netFrameworkVersion: 'v8.0'
      }
    }
  }
