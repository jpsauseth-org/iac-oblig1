provider "azurerm" {
  features {}

  resource_providers_to_register = ["Microsoft.Network"]
}

# Henter outputs fra network-stacken i SAMME miljø.
data "terraform_remote_state" "network" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.backend_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_container_name
    key                  = "env/${var.environment}/network.tfstate"
    use_azuread_auth     = true
  }
}

locals {
  # Samme navnekonvensjon som network-stacken: <prosjekt>-<miljø>-<kortnavn>
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

resource "azurerm_network_interface" "nic" {
  name                = format("nic-%s", local.base_name)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.network.outputs.subnet_ids[var.nic_subnet_key]
    private_ip_address_allocation = "Dynamic"
  }
}