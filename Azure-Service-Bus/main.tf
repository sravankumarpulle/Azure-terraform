terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

module "service-bus_private_endpoint" {
  source                         = "./modules/private_endpoint"
  name                           = "${azurerm_servicebus_namespace.servicebus_namespace.name}service-bus"
  location                       = var.location
  resource_group_name            = var.resource_group_name
  subnet_id                      = data.azurerm_subnet.endpoint_subnet.id
  tags                           = var.tags
  private_connection_resource_id = azurerm_servicebus_namespace.servicebus_namespace.id
  is_manual_connection           = var.is_manual_connection
  subresource_name               = "namespace"
  
}


