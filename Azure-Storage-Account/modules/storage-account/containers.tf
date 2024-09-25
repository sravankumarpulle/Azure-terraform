resource "azurerm_storage_data_lake_gen2_filesystem" "raw" {
  name               = "raw-layer"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [
    azurerm_role_assignment.role_assignment,
    time_sleep.role_assignment_sleep,
    module.blob_private_endpoint,
    module.dfs_private_endpoint
  ]

  ace {
    type        = "user"
    permissions = "rwx"
  }
  # test
  ace {
    type        = "user"
    id          = azurerm_role_assignment.role_assignment.principal_id
    permissions = "--x"
  }
  ace {
    type        = "group"
    permissions = "r-x"
  }
  ace {
    type        = "mask"
    permissions = "r-x"
  }
  ace {
    type        = "other"
    permissions = "---"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "landing" {
  name               = "landing-layer"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [
    azurerm_role_assignment.role_assignment,
    time_sleep.role_assignment_sleep,
    module.blob_private_endpoint,
    module.dfs_private_endpoint
  ]

  ace {
    type        = "user"
    permissions = "rwx"
  }
  ace {
    type        = "group"
    permissions = "r-x"
  }
  ace {
    type        = "mask"
    permissions = "r-x"
  }
  ace {
    type        = "other"
    permissions = "---"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "curated" {
  name               = "curated-layer"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [
    azurerm_role_assignment.role_assignment,
    time_sleep.role_assignment_sleep,
    module.blob_private_endpoint,
    module.dfs_private_endpoint
  ]

  ace {
    type        = "user"
    permissions = "rwx"
  }
  ace {
    type        = "group"
    permissions = "r-x"
  }
  ace {
    type        = "mask"
    permissions = "r-x"
  }
  ace {
    type        = "other"
    permissions = "---"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "archive" {
  name               = "archive-layer"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [
    azurerm_role_assignment.role_assignment,
    time_sleep.role_assignment_sleep,
    module.blob_private_endpoint,
    module.dfs_private_endpoint
  ]

  ace {
    type        = "user"
    permissions = "rwx"
  }
  ace {
    type        = "group"
    permissions = "r-x"
  }
  ace {
    type        = "mask"
    permissions = "r-x"
  }
  ace {
    type        = "other"
    permissions = "---"
  }
}

// resource "azurerm_storage_data_lake_gen2_filesystem" "ehone" {
//   name               = "eventhub01"
//   storage_account_id = azurerm_storage_account.storage_account.id
//   depends_on = [
//     azurerm_role_assignment.role_assignment,
//     time_sleep.role_assignment_sleep,
//     module.blob_private_endpoint,
//     module.dfs_private_endpoint
//   ]

//   ace {
//     type        = "user"
//     permissions = "rwx"
//   }
//   ace {
//     type        = "group"
//     permissions = "r-x"
//   }
//   ace {
//     type        = "mask"
//     permissions = "r-x"
//   }
//   ace {
//     type        = "other"
//     permissions = "---"
//   }
// }

resource "azurerm_storage_data_lake_gen2_filesystem" "ehtwo" {
  name               = "eventhub02"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [
    azurerm_role_assignment.role_assignment,
    time_sleep.role_assignment_sleep,
    module.blob_private_endpoint,
    module.dfs_private_endpoint
  ]

  ace {
    type        = "user"
    permissions = "rwx"
  }
  ace {
    type        = "group"
    permissions = "r-x"
  }
  ace {
    type        = "mask"
    permissions = "r-x"
  }
  ace {
    type        = "other"
    permissions = "---"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "source_layer" {
  name               = "source-layer"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [
    azurerm_role_assignment.role_assignment,
    time_sleep.role_assignment_sleep,
    module.blob_private_endpoint,
    module.dfs_private_endpoint
  ]

  ace {
    type        = "user"
    permissions = "rwx"
  }
  ace {
    type        = "group"
    permissions = "r-x"
  }
  ace {
    type        = "mask"
    permissions = "r-x"
  }
  ace {
    type        = "other"
    permissions = "---"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datacontainer" {
  name               = "datacontainer"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [
    azurerm_role_assignment.role_assignment,
    time_sleep.role_assignment_sleep,
    module.blob_private_endpoint,
    module.dfs_private_endpoint
  ]

  ace {
    type        = "user"
    permissions = "rwx"
  }
  ace {
    type        = "group"
    permissions = "r-x"
  }
  ace {
    type        = "mask"
    permissions = "r-x"
  }
  ace {
    type        = "other"
    permissions = "---"
  }
}
