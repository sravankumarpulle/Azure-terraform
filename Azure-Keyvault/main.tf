module "key_vault" {
  source                          = "./modules/key_vault"
  name                            = var.key_vault_name
  location                        = data.azurerm_resource_group.rg.location
  resource_group_name             = data.azurerm_resource_group.rg.name
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = "standard"
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  enable_rbac_authorization       = true
  purge_protection_enabled        = true
  soft_delete_retention_days      = 30
  bypass                          = "AzureServices"
  default_action                  = "Deny"
  ip_rules                        = [ "163.116.199.114","163.116.205.120", "163.116.205.114", "163.116.199.120", "163.116.199.117", "163.116.199.119", "163.116.205.113", "163.116.199.113", "163.116.205.123"] # This will be changed in Adani Env (data.http.ip.response_body, "163.116.199.120")
  public_network_access           = false                      # This will be changed in Adani Env
  subscription_id                 = data.azurerm_client_config.current.subscription_id
  vnet_rg_name                    = var.vnet_rg_name
  vnet_name                       = var.vnet_name
  pe_subnet_name                  = var.pe_subnet_name
  pe_subnet_id                    = data.azurerm_subnet.endpoint_subnet.id
  tags                            = var.tags
}

