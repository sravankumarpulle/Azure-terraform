module "postgresql_database" {
  source                        = "./modules/postgresql"
  name                          = var.postgresql_name
  resource_group_name           = data.azurerm_resource_group.resource_group_name.name
  private_dns_zone_id          = var.private_dns_zone_id
  location                      = data.azurerm_resource_group.resource_group_name.location
  sku_name                      = var.sku_name
  delegated_subnet_id           = data.azurerm_subnet.delegated_postgres_subnet.id
  delegated_subnet_name         = data.azurerm_subnet.delegated_postgres_subnet.name
  storage_mb                    = var.storage_mb
  backup_retention_days         = var.backup_retention_days
  psql_version                  = var.psql_version
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
  public_network_access_enabled = var.public_network_access_enabled
  keyvault_id                   = data.azurerm_key_vault.key_vault.id
  tags                          = var.tags
  administrator_login           = var.administrator_login
  subscription_id               = data.azurerm_client_config.current.subscription_id
  vnet_rg_name                  = var.vnet_rg_name
  vnet_name                     = var.vnet_name
  pe_subnet_id                  = data.azurerm_subnet.endpoint_subnet.id
  postgres_db_name              = var.postgres_db_name
  // postgres_high_availability_mode = var.postgres_high_availability_mode
  // postgres_standby_availability_zone = var.postgres_standby_availability_zone
}
