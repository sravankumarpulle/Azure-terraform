data "azurerm_client_config" "current" {}
data "azurerm_resource_group" "resource_group_name" {
    name = var.resource_group_name
}


data "azurerm_storage_account" "storage_account" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.resource_group_name.name
}