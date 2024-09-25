function_app_name                          = "az01aflp01" #az23aflapp0001"
app_service_plan_name                      = "az01asp01" #az23aspapp0001"
// function_app_plan_name                     = "function_app_plan"
sku_tier                                   = "Dynamic"
sku_size                                   = "EP1"
maximum_elastic_worker_count               = 1
elastic_instance_minimum                   = 1
reserved                                   =  true
per_site_scaling                           = false
storage_account_name                       = "az01asap01"
// storage_account_access_key                 = "YOedhKLyDiXq6c0G3+EJ3ahn48K/tPLsTCVdQVxGhXtsmMSsfmzyNpdGJ9K1mpET4IJrVbPqqOpq+AStwBiymQ=="     
public_network_access_enabled = false
// subscription_id               = data.azurerm_client_config.current.subscription_id

resource_group_name = "IC-Common-Prod-RG"
location = "Central India"
vnet_name       = "IC-Common-Prod-VNET"
vnet_rg_name    = "IC-Common-Prod-RG"
pe_subnet_name  = "IC-Common-Prod-VNET-PE-SNET-01"
subscription_id = "f33ad4d2-0349-41ba-8225-c808491d4610"