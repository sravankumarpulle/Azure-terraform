resource "azurerm_monitor_action_group" "email_alert" {
  name                = "resource-email-alert"
  resource_group_name = data.azurerm_resource_group.rg.name
  short_name          = "email"
  
  email_receiver {
    name                    = "sendtoadmin"
    email_address           = "harish.kalyanaraman@pwc.com"
    use_common_alert_schema = true
  }
  email_receiver {
    name                    = "sendtopwcadmin"
    email_address           = "shreya.deepak@pwc.com"
    use_common_alert_schema = true
  }

}