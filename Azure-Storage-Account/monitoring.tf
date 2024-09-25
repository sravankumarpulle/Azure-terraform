resource "azurerm_monitor_metric_alert" "storage_account_metric_alert" {
  name                = "storageaccount-metricalert"
  resource_group_name = data.azurerm_resource_group.rg.name
  scopes              = [module.storage_account.id]
  description         = "Storage Account Monitoring alert"

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Availability"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Egress"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Ingress"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_monitor_metric_alert.storage_account_metric_alert,
    module.storage_account
  ]
}

# resource "azurerm_monitor_activity_log_alert" "storage_account_activity_log" {
#   name                = "storageaccount-activitylogalert"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   scopes              = [module.storage_account.id]
#   description         = "This alert will monitor a specific storage account updates."

#   criteria {
#     resource_id    = module.storage_account.id
#     //operation_name = "Microsoft.Storage/storageAccounts/write"
#     category       = "ResourceHealth"

#     resource_health {
#       current = ["Unavailable", "Degraded"]
#       previous = ["Available"]
#     }
#   }

#   action {
#     action_group_id = data.azurerm_monitor_action_group.email_alert.id
#   }

#   depends_on = [
#     azurerm_monitor_activity_log_alert.storage_account_activity_log,
#     module.storage_account
#   ]
# }
