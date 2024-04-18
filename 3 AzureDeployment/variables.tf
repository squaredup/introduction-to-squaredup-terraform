variable "squaredup_api_key" {
  description = "The SquaredUp API key"
  type        = string
}

variable "azure_plugin_name" {
  description = "The name of the Azure plugin to use"
  type        = string
  default     = "Azure"
}

variable "azure_tenant_id" {
  description = "The Azure tenant Id to create a datasource for"
  type        = string
}

variable "azure_client_id" {
  description = "The Azure client Id"
  type        = string  
}

variable "azure_client_secret" {
  description = "The Azure client secret"
  type        = string
}

variable "azure_subscription_id" {
  description = "The Azure subscription Id"
  type        = string
}

variable "azure_vm_name" {
  description = "The name of the Azure VM to create a dashboard for"
  type        = string
}

variable "azure_target_subscription_name" {
  description = "The name of the Azure subscription to create a dashboard for"
  type        = string  
}