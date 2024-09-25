function_app_name                          = "az01aflqa01" #az23aflapp0001"
app_service_plan_name                      = "az01aspqa01" #az23aspapp0001"
// function_app_plan_name                     = "function_app_plan"
sku_tier                                   = "Dynamic"
sku_size                                   = "EP1"
maximum_elastic_worker_count               = 1
elastic_instance_minimum                   = 1
reserved                                   =  true
per_site_scaling                           = false
storage_account_name                       = "az01asaqa01"
// storage_account_access_key                 = "YOedhKLyDiXq6c0G3+EJ3ahn48K/tPLsTCVdQVxGhXtsmMSsfmzyNpdGJ9K1mpET4IJrVbPqqOpq+AStwBiymQ=="     
public_network_access_enabled = false
// subscription_id               = data.azurerm_client_config.current.subscription_id

resource_group_name = "IC-Common-NonProd-RG"
location = "Central India"
vnet_name       = "IC-Common-NonProd-VNET"
vnet_rg_name    = "IC-Common-NonProd-RG"
pe_subnet_name  = "IC-Common-NonProd-VNET-QA-PE-SNET-01"
subscription_id = "14ab3967-5405-4155-8149-cfe09d49cd37"