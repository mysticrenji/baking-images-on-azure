terraform {
  backend "azurerm" {
    resource_group_name  = "golden-image-factory-backend"
    storage_account_name = "terraformbackendfactory"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"

  }
}