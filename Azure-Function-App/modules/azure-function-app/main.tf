resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku_size
}


resource "azurerm_linux_function_app" "function_app" {
  name                            = var.function_app_name # "az23aflapp0001"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  storage_account_name            = data.azurerm_storage_account.storage_account.name
  // storage_account_access_key      = data.azurerm_storage_account.storage_account.primary_access_key
  tags                            = var.tags
  public_network_access_enabled   = var.public_network_access_enabled
  service_plan_id                 = azurerm_service_plan.app_service_plan.id
  https_only                      = true
  
  identity {
    type = "SystemAssigned"
  }
  site_config {
    application_stack {
      node_version             = "18"
    }
  }
}

module "function_app_private_endpoint" {
  source                         = "../private-endpoint"
  name                           = "${azurerm_linux_function_app.function_app.name}PE"
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = var.pe_subnet_id
  tags                           = var.tags
  private_connection_resource_id = azurerm_linux_function_app.function_app.id
  is_manual_connection           = false
  subresource_name               = "sites" 
}

