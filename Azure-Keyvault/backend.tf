// Deployment for QA Env
// terraform {    
//    backend "azurerm" {
//     resource_group_name  = "IC-Common-NonProd-RG"
//     storage_account_name = "az01sabqa01"
//     container_name       = "keyvault1"
//     key                  = "keyvault_terraform.tfstate"
//   }

// }

//Deployment for Prod Env
terraform {    
   backend "azurerm" {
    resource_group_name  = "IC-Common-Prod-RG"
    storage_account_name = "az01tfstateprod01"
    container_name       = "keyvault"
    key                  = "keyvault_terraform.tfstate"
  }

}