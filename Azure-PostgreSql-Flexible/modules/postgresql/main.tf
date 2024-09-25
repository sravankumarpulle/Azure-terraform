terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.9.0"
    }
    // azapi = {
    //   source  = "Azure/azapi"
    //   version = "~> 1.8.0"
    // }
  }

  required_version = ">= 0.14.9"
}

resource "azurerm_user_assigned_identity" "psql_identity" {
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  name = "${var.name}Identity"

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}


resource "random_password" "postgres_password" {
  length  = 32
  special = true
}

resource "azurerm_postgresql_flexible_server" "adl_psql_server" {
  name                         = var.name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  sku_name                     = var.sku_name
  delegated_subnet_id          = data.azurerm_subnet.delegated_postgres_subnet.id
  private_dns_zone_id          = var.private_dns_zone_id # "/subscriptions/c50a8fb7-0872-4df8-991a-e994f8cafe5c/resourceGroups/glz-management-rg/providers/Microsoft.Network/privateDnsZones/privatelink.postgres.database.azure.com"
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  version                      = var.psql_version
  administrator_login          = var.administrator_login
  administrator_password       = random_password.postgres_password.result 


  identity {
    type         = "UserAssigned"
    identity_ids = tolist([azurerm_user_assigned_identity.psql_identity.id])
  }

  // high_availability {
  //   mode = var.postgres_high_availability_mode
  //   standby_availability_zone = var.postgres_standby_availability_zone
  // }

  lifecycle {
    ignore_changes = [
      zone
    ]
  }
  tags       = var.tags
}

resource "azurerm_postgresql_flexible_server_configuration" "uuid_ossp" {
  name      = "azure.extensions"
  server_id = azurerm_postgresql_flexible_server.adl_psql_server.id
  value     = "UUID-OSSP"
  depends_on = [ azurerm_postgresql_flexible_server.adl_psql_server ]
}


resource "azurerm_key_vault_secret" "psql_pass" {
  name         = "adani-ic-db-password"
  key_vault_id = var.keyvault_id
  value        = random_password.postgres_password.result
}

resource "azurerm_key_vault_secret" "psql_user" {
  name         = "adani-ic-db-username"
  key_vault_id = var.keyvault_id
  value        = var.administrator_login
}

resource "azurerm_key_vault_secret" "psql_host" {
  name         = "adani-ic-db-server-name"
  key_vault_id = var.keyvault_id
  value        = "${var.name}.postgres.database.azure.com"
}

resource "azurerm_key_vault_secret" "psql_db" {
  name         = "adani-ic-db-name"
  key_vault_id = var.keyvault_id
  value        = azurerm_postgresql_flexible_server_database.adani_ic_Qa.name
}

