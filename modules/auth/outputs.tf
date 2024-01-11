output "web_app_client_id" {
  value = azuread_application.web_app.application_id
}

output "web_app_password" {
  value = azuread_application_password.web_app_password.value
  sensitive = true
}

output "web_app_principal_id" {
  value = azuread_service_principal.web_app.object_id
}

output "web_app_role_id" {
  value = azuread_application.web_app.app_role.*.id[0]
}