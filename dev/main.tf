terraform {
  backend "azurerm" {
    resource_group_name  = "dev-terraform-state"
    storage_account_name = "devtfstate111"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}

resource "azurerm_resource_group" "rg" {
  name     = "dev-terraform-example"
  location = "West Europe"
}

module "web_app" {
  source                  = "../modules/web_app"
  web_app_name            = "dev-terraform-example"
  dotnet_version          = "6.0"
  sku_name                = "S1"
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
}

module "function_app" {
  source                  = "../modules/function_app"
  function_app_name       = "devterraformfunction"
  service_plan_id         = module.web_app.service_plan_id
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  web_app_role_id         = module.auth.web_app_role_id
  web_app_principal_id    = module.auth.web_app_principal_id
}

module "auth" {
  source       = "../modules/auth"
  web_app_name = "devterraformexample"
}