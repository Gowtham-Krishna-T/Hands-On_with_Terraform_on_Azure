terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "testing145"

    workspaces {
      name = "Hands_On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-41635c24-hands-on-with-terraform-on-azure"
  location = "westus"
}

module "securestorage" {
  source  = "app.terraform.io/testing145/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "storageacc456377r48"
}