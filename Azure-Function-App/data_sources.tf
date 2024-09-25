data "azurerm_client_config" "current" {}
data "azurerm_resource_group" "resource_group_name" {
    name = var.resource_group_name
}


data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg_name
}

data "azurerm_subnet" "endpoint_subnet" {
  name                 = var.pe_subnet_name
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.vnet_name
}

data "azurerm_storage_account" "storage_account" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.resource_group_name.name
}

