module "data_explorer_cluster" {
  source                        = "./modules/data_explorer/cluster"
  name                          = var.data_explorer_cluster_name
  resource_group_name           = data.azurerm_resource_group.rg.name
  location                      = data.azurerm_resource_group.rg.location
  auto_stop_enabled             = var.auto_stop_enabled
  disk_encryption_enabled       = var.disk_encryption_enabled
  streaming_ingestion_enabled   = var.streaming_ingestion_enabled
  public_network_access_enabled = var.public_network_access_enabled
  purge_enabled                 = var.purge_enabled
  zones                         = var.zones
  engine                        = var.engine
  sku_name                      = var.sku_name
  maximum_instances             = var.maximum_instances
  minimum_instances             = var.minimum_instances
  tags                          = var.tags
  subscription_id               = data.azurerm_client_config.current.subscription_id
  vnet_rg_name                  = var.vnet_rg_name
  vnet_name                     = var.vnet_name
  pe_subnet_id                  = data.azurerm_subnet.endpoint_subnet.id
  keyvault_id                   = data.azurerm_key_vault.key_vault.id
}

module "data_explorer_database" {
  source              = "./modules/data_explorer/database"
  name                = var.data_explorer_database_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  cluster_name        = module.data_explorer_cluster.name
  hot_cache_period    = var.hot_cache_period
  soft_delete_period  = var.soft_delete_period
  tags                = var.tags
  keyvault_id         = data.azurerm_key_vault.key_vault.id
  depends_on          = [module.data_explorer_cluster]
}
