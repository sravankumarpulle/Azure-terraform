resource "azurerm_kusto_database" "database" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.cluster_name
  hot_cache_period    = var.hot_cache_period
  soft_delete_period  = var.soft_delete_period
}

resource "azurerm_key_vault_secret" "adx_db_name" {
  name         = "adani-ic-adx-db-name"
  key_vault_id = var.keyvault_id
  value        = var.name
}
