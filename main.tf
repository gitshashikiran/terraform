terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.106.1"
    }
  }
}

provider "azurerm" {
features {}
}

resource "azurerm_resource_group" "test" {
  name     = "MyRg1"
  location = "central india"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  location            = "central india"
  resource_group_name = "MyRg1"
  address_space       = ["10.0.0.0/16"]
  
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }
  depends_on = [ azurerm_resource_group.test ]   <#dependency resource on resource "RG">
  }