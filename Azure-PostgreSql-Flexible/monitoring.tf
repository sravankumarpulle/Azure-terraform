resource "azurerm_monitor_metric_alert" "postgres_metric_alert" {
  name                = "postgres-metricalert"
  resource_group_name = data.azurerm_resource_group.resource_group_name.name
  scopes              = [module.postgresql_database.id]
  description         = "Postgresql Monitoring alert"

  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "active_connections"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "client_connections_active"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "cpu_percent"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "connections_failed"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 2
  }
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "memory_percent"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 2
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_monitor_metric_alert.postgres_metric_alert,
    module.postgresql_database
  ]
}

resource "azurerm_monitor_metric_alert" "postgres_metric_alert_2" {
  name                = "postgres-metricalert-2"
  resource_group_name = data.azurerm_resource_group.resource_group_name.name
  scopes              = [module.postgresql_database.id]
  description         = "Postgresql Monitoring alert"

  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "deadlocks"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 2
  }
  action {
    action_group_id = data.azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_monitor_metric_alert.postgres_metric_alert,
    module.postgresql_database
  ]
}



resource "azurerm_monitor_activity_log_alert" "postgres_activity_log" {
  name                = "postresql-activitylogalert"
  resource_group_name = data.azurerm_resource_group.resource_group_name.name
  scopes              = [module.postgresql_database.id]
  description         = "This alert will monitor a specific postgresql updates."

  criteria {
    resource_id    = module.postgresql_database.id
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
    azurerm_monitor_activity_log_alert.postgres_activity_log,
    module.postgresql_database
  ]
}