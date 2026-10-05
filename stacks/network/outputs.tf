output "subnet_ids" {
  value       = module.network.subnet_ids
  description = "Subnet-ID per subnettnavn. Leses av app-stacken via terraform_remote_state"
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Navnet på resource group-en til nettverket"
}