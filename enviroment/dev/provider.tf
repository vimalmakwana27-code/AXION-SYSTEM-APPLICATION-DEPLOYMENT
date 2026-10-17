terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }


  backend "azurerm" {
    resource_group_name = "vimal-storage-RG"
    storage_account_name = "vimalstorage798"                                 
    container_name       = "tfstate"                                 
    key                  = "dev.terraform.tfstate"                   
}

}

provider "azurerm" {
  features {}
}