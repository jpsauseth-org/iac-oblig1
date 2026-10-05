provider "azurerm" {
  features {}

  resource_providers_to_register = ["Microsoft.Network"]
}

data "terraform_remote_state" "network" {
    resource_group_name
    storage_account_name
    container_name
    use_azuread_auth
    key
}

locals {
  base_name = lower(format("%s-%s-%s", var.project, var.environment, var.shortname))
  tags = {
    environment = var.environment
    owner       = var.shortname
    project     = var.project
    stack       = "app"
    managedby   = "terraform"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = format("rg-app-%s", local.base_name)
  location = var.location
  tags     = local.tags
}

resource "azurerm_network_interface" "ip_configuration" {
    name                          = 
    subnet_id                     = "data.terraform_remote_state.network.outputs.<output-navnet ditt>[<subnett-navn>]"
    private_ip_address_allocation = "Dynamic"
}