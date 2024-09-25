// terraform {    
//    backend "azurerm" {
//     resource_group_name  = "IC-Common-NonProd-RG"
//     storage_account_name = "az01sabqa01"
//     container_name       = "functionapp"
//     key                  = "function_terraform.tfstate"
//   }

// }

// terraform {    
//    backend "azurerm" {
//     resource_group_name  = "IC-Common-Prod-RG"
//     storage_account_name = "az01tfstateprod01"
//     container_name       = "functionapp"
//     key                  = "function_terraform.tfstate"
//   }

// }

terraform {    
   backend "azurerm" {
  }
}
