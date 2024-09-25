data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
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

data "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.vnet_name
}

data "azurerm_monitor_action_group" "email_alert" {
  resource_group_name = data.azurerm_resource_group.rg.name
  name                = var.monitor_action_group_name
}







