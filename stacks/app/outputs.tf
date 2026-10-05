output "nic_id" {
  value       = azurerm_network_interface.nic.id
  description = "ID-en til nettverkskortet"
}

output "nic_private_ip" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "Privat IP-adresse NIC-en fikk fra subnettet"
}