resource "azurerm_monitor_metric_alert" "adx_metric_alert" {
  name                = "adx-metricalert"
  resource_group_name = data.azurerm_resource_group.rg.name
  scopes              = [module.data_explorer_cluster.id]
  description         = "ADX Monitoring alert"

  criteria {
    metric_namespace = "Microsoft.Kusto/clusters"
    metric_name      = "CPU"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.Kusto/clusters"
    metric_name      = "EventsDropped"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.Kusto/clusters"
    metric_name      = "IngestionUtilization"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.Kusto/clusters"
    metric_name      = "IngestionLatencyInSeconds"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.Kusto/clusters"
    metric_name      = "TotalNumberOfThrottledQueries"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_monitor_metric_alert.adx_metric_alert,
    module.data_explorer_cluster
  ]
}

resource "azurerm_monitor_metric_alert" "adx_metric_alert_2" {
  name                = "adx-metricalert-2"
  resource_group_name = data.azurerm_resource_group.rg.name
  scopes              = [module.data_explorer_cluster.id]
  description         = "ADX Monitoring alert"

  criteria {
    metric_namespace = "Microsoft.Kusto/clusters"
    metric_name      = "QueryDuration"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.Kusto/clusters"
    metric_name      = "QueueLength"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 2
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_monitor_metric_alert.adx_metric_alert,
    module.data_explorer_cluster
  ]
}

resource "azurerm_monitor_activity_log_alert" "adx_activity_log" {
  name                = "adx-activitylogalert"
  resource_group_name = data.azurerm_resource_group.rg.name
  scopes              = [module.data_explorer_cluster.id]
  description         = "This alert will monitor a specific adx updates."

  criteria {
    resource_id    = module.data_explorer_cluster.id
    //operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "ResourceHealth"

    resource_health {
      current = ["Unavailable", "Degraded"]
      previous = ["Available"]
    }
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_monitor_activity_log_alert.adx_activity_log,
    module.data_explorer_cluster
  ]
}
