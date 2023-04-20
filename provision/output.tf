output "azurerm_shared_image_id" {
  value = azurerm_public_ip.runtime_farm_public_ip.fqdn
}
