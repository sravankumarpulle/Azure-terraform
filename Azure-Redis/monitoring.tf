// resource "azurerm_monitor_action_group" "email_alert" {
//   name                = "email-alert"
//   resource_group_name = data.azurerm_resource_group.rg.name
//   short_name          = "email"
  
//   email_receiver {
//     name                    = "sendtoadmin"
//     email_address           = "abhishek.gaur@pwc.com"
//     use_common_alert_schema = true
//   }
// }

resource "azurerm_monitor_metric_alert" "redis_metric_alert" {
  name                = "redis-metricalert"
  resource_group_name = data.azurerm_resource_group.rg.name
  scopes              = [module.redis_cache.id]
  description         = "Redis Monitoring alert"

  criteria {
    metric_namespace = "Microsoft.Cache/redis"
    metric_name      = "errors"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1
  }
  criteria {
    metric_namespace = "Microsoft.Cache/redis"
    metric_name      = "serverLoad"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 2
  }

  action {
    action_group_id = data.azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_monitor_metric_alert.redis_metric_alert,
    module.redis_cache
  ]
}