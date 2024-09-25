
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_subnet" "endpoint_subnet" {
  name                 = var.private_endpoint_subnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = var.virtual_network_name
}

data "azurerm_key_vault" "key_vault" {
  name                 = var.key_vault_name
  resource_group_name  = var.resource_group_name
}
