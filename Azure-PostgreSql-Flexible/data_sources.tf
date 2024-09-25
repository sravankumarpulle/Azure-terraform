data "azurerm_client_config" "current" {}


data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg_name
}

data "azurerm_subnet" "endpoint_subnet" {
  name                 = var.pe_subnet_name
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.vnet_name
}

data "azurerm_subnet" "delegated_postgres_subnet" {
  name                 = var.delegated_subnet_name
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.vnet_name
}

data "azurerm_resource_group" "resource_group_name" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault
  resource_group_name = var.resource_group_name
}

data "azurerm_monitor_action_group" "email_alert" {
  resource_group_name = data.azurerm_resource_group.resource_group_name.name
  name                = var.monitor_action_group_name
}


