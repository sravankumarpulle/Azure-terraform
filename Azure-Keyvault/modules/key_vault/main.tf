terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  required_version = ">= 0.14.9"
}

resource "azurerm_key_vault" "key_vault" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  sku_name                        = var.sku_name
  tags                            = var.tags
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  purge_protection_enabled        = var.purge_protection_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  public_network_access_enabled   = var.public_network_access

  timeouts {
    delete = "60m"
  }

  network_acls {
    bypass                     = var.bypass
    default_action             = var.default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

}

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
  
}

# Sleep is needed to wait for role assignment to propagate
resource "time_sleep" "role_assignment_sleep" {
  create_duration = "120s"

  triggers = {
    role_assignment = azurerm_role_assignment.role_assignment.id
  }
}




# Private Endpoint

module "key_vault_private_endpoint" {
  source                         = "../private_endpoint"
  name                           = "${azurerm_key_vault.key_vault.name}-PE"
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = var.pe_subnet_id
  tags                           = var.tags
  private_connection_resource_id = azurerm_key_vault.key_vault.id
  is_manual_connection           = false
  subresource_name               = "vault"
}
