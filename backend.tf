terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01657087RG"
    storage_account_name = "tfstaten01657087sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}
