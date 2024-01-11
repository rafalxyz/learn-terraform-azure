resource "azurerm_service_plan" "plan" {
  name                = var.web_app_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = false
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }
}