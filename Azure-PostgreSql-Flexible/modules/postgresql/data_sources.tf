data "azurerm_subnet" "delegated_postgres_subnet" {
  name                 = var.delegated_subnet_name
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.vnet_name
}