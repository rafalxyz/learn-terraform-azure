variable "web_app_name" {
  type = string
}

variable "dotnet_version" {
  type        = string
  description = "Dotnet version"
  default     = "6.0"
}

variable "sku_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}