module "redis_cache" {
  source                        = "./modules/redis_cache"
  name                          = var.redis_cache_name
  resource_group_name           = data.azurerm_resource_group.rg.name
  location                      = data.azurerm_resource_group.rg.location
  capacity                      = var.capacity 
  family                        = var.family 
  sku_name                      = var.sku_name 
  enable_non_ssl_port           = var.enable_non_ssl_port 
  minimum_tls_version           = var.minimum_tls_version 
  public_network_access_enabled = var.public_network_access_enabled 
  tags                          = var.tags
  subscription_id               = data.azurerm_client_config.current.subscription_id
  vnet_name                     = var.vnet_name
  vnet_rg_name                  = data.azurerm_resource_group.rg.name
  pod_subnet_id                 = data.azurerm_subnet.aks_subnet.id 
}
