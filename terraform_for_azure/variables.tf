variable "application_name" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "primary_location" {
  type = string
}

variable "service_principal_id" {
  type        = string
  description = "Client ID of the Service Principal"
  default     = ""
}
