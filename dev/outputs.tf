output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "web_app_name" {
  value = module.web_app.web_app_name
}

output "web_app_app_registration_client_id" {
  value = module.auth.web_app_client_id
}

output "web_app_app_registration_password" {
  value     = module.auth.web_app_password
  sensitive = true
}

output "function_app_principal_id" {
  value = module.function_app.function_app_principal_id
}