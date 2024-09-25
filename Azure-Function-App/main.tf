module "function_app" {
  source                                     = "./modules/azure-function-app"
  function_app_name                          = var.function_app_name
  app_service_plan_name                      = var.app_service_plan_name
  // function_app_plan_name                     = var.function_app_plan_name
  sku_tier                                   = var.sku_tier
  sku_size                                   = var.sku_size
  maximum_elastic_worker_count               = var.maximum_elastic_worker_count
  reserved                                   = var.reserved
  per_site_scaling                           = var.per_site_scaling
  storage_account_name                       = data.azurerm_storage_account.storage_account.name
  // storage_account_access_key                 = data.azurerm_storage_account.storage_account.primary_access_key
  resource_group_name                        = var.resource_group_name
  elastic_instance_minimum                   = var.elastic_instance_minimum
  location                                   = data.azurerm_resource_group.resource_group_name.location          
  public_network_access_enabled              = var.public_network_access_enabled
  pe_subnet_id                               = data.azurerm_subnet.endpoint_subnet.id
  tags                                       = var.tags
}