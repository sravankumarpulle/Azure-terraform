terraform {    
   backend "azurerm" {
    resource_group_name  = "IC-Common-NonProd-RG"
    storage_account_name = "az01sabqa01"
    container_name       = "servicebustfstateqa"
    key                  = "servicebus_terraform.tfstate"
  }

}