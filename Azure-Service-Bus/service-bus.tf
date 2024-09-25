resource "azurerm_servicebus_namespace" "servicebus_namespace" {
  name                          = var.service_bus_namespace
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku 
  capacity                      = var.capacity 
  public_network_access_enabled = false
  tags                          = var.tags


  identity {
    type = "SystemAssigned"
  }

  network_rule_set {
    default_action                =  var.default_action 
    public_network_access_enabled = var.public_network_access_enabled 
    trusted_services_allowed      = var.trusted_services_allowed 
  }
}

resource "azurerm_servicebus_queue" "servicebus_queue" {
  name         =  var.servicebus_queue_name #  
  namespace_id = azurerm_servicebus_namespace.servicebus_namespace.id

}


resource "azurerm_servicebus_topic" "servicebus_topic" {
  name         =  var.service_bus_topic_name  
  namespace_id = azurerm_servicebus_namespace.servicebus_namespace.id

  max_size_in_megabytes = var.max_size_in_megabytes 

}


resource "azurerm_servicebus_subscription" "servicebus_subscription" {
  depends_on = [azurerm_servicebus_topic.servicebus_topic]
  name       = var.servicebus_subscription_name 
  topic_id   = azurerm_servicebus_topic.servicebus_topic.id

  max_delivery_count = var.max_delivery_count 
}
