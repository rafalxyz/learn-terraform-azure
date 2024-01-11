resource "azurerm_storage_account" "function_app" {
  name                     = var.function_app_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_linux_function_app" "function_app" {
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  storage_account_name       = azurerm_storage_account.function_app.name
  storage_account_access_key = azurerm_storage_account.function_app.primary_access_key
  service_plan_id            = var.service_plan_id

  site_config {
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azuread_app_role_assignment" "role_assignment" {
  app_role_id         = var.web_app_role_id
  principal_object_id = azurerm_linux_function_app.function_app.identity[0].principal_id
  resource_object_id  = var.web_app_principal_id
}