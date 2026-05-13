terraform {
  required_version = "~> 1.6.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "tfstate-rg1"
    storage_account_name = "tfstateaccount169"
    container_name = "tfstate"
    key = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "515776c8-b3a8-4862-9224-9442d9a6ebb9"
  # subscription_id = "af6aa2e9-539c-4948-b07c-d9aef5cc7c92"
}