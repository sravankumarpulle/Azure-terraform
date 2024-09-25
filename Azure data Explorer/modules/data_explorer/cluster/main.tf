terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.9.0"
    }

  }

  required_version = ">= 0.14.9"
}

resource "azurerm_kusto_cluster" "cluster" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  auto_stop_enabled             = var.auto_stop_enabled
  disk_encryption_enabled       = var.disk_encryption_enabled
  streaming_ingestion_enabled   = var.streaming_ingestion_enabled
  public_network_access_enabled = var.public_network_access_enabled
  purge_enabled                 = var.purge_enabled
  zones                         = var.zones
  # engine                        = var.engine
  tags = var.tags

  sku {
    name = var.sku_name
    # capacity = var.sku_capacity
  }

  optimized_auto_scale {
    maximum_instances = var.maximum_instances
    minimum_instances = var.minimum_instances
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_key_vault_secret" "adx_cluster_name" {
  name         = "adani-ic-adx-cluster-name"
  key_vault_id = var.keyvault_id
  value        = "${var.name}.${var.location}"
}

module "data_explorer_private_endpoint" {
  source                         = "../../private_endpoint"
  name                           = "${azurerm_kusto_cluster.cluster.name}-PE"
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = var.pe_subnet_id
  tags                           = var.tags
  private_connection_resource_id = azurerm_kusto_cluster.cluster.id
  is_manual_connection           = false
  subresource_name               = "cluster"
}


