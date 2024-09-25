terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  required_version = ">= 0.14.9"
}

resource "azurerm_redis_cache" "adl_redis" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  capacity                      = var.capacity
  family                        = var.family
  sku_name                      = var.sku_name
  enable_non_ssl_port           = var.enable_non_ssl_port
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled

  redis_configuration {
  }

  tags = var.tags

  identity {
    type = "SystemAssigned"
  }
}


# Private Endpoint

module "redis_cache_private_endpoint" {
  source                         = "../private_endpoint"
  name                           = "${azurerm_redis_cache.adl_redis.name}PE"
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = var.pod_subnet_id
  tags                           = var.tags
  private_connection_resource_id = azurerm_redis_cache.adl_redis.id
  is_manual_connection           = false
  subresource_name               = "redisCache"
}


