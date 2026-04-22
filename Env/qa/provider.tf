terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-pip"
    storage_account_name = "strpipeline123"
    container_name       = "containerpipeline"
    key                  = "keystatefile-qa"
    }
}

provider "azurerm" {
    features {}
    subscription_id = "515776c8-b3a8-4862-9224-9442d9a6ebb9"
}