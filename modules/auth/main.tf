data "azuread_client_config" "current" {}

resource "azuread_application" "web_app" {
  display_name     = var.web_app_name
  identifier_uris  = ["api://${var.web_app_name}"]
  owners           = [data.azuread_client_config.current.object_id]

  app_role {
    allowed_member_types = ["Application"]
    description          = "Allows acceess as application"
    display_name         = "Access as Application"
    enabled              = true
    id                   = "1b19509b-32b1-4e9f-b71d-4992aa991967"
    value                = "access_as_application"
  }
}

resource "azuread_service_principal" "web_app" {
  application_id = azuread_application.web_app.application_id
}

resource "azuread_application_password" "web_app_password" {
  application_object_id = azuread_application.web_app.object_id
}