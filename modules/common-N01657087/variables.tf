// common-N01657087/variables.tf

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the resources are created"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the log analytics workspace"
  type        = string
  default     = "N01657087-LAW"
}

variable "recovery_vault_name" {
  description = "The name of the recovery services vault"
  type        = string
  default     = "N01657087-RSV"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "n01657087storage"
}

variable "assignment" {
  description = "Assignment tag value"
  type        = string
  default     = "CCGC 5502 Automation Assignment"
}

variable "name" {
  description = "Name tag value"
  type        = string
  default     = "ashna.paul"
}

variable "expiration_date" {
  description = "Expiration date tag value"
  type        = string
  default     = "2024-12-31"
}

variable "environment" {
  description = "Environment tag value"
  type        = string
  default     = "Learning"
}
