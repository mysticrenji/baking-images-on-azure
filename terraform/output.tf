output "azurerm_shared_image_id" {
  value = azurerm_shared_image.windows.id
}
output "azurerm_shared_image_name" {
  value = azurerm_shared_image.windows.name
}
output "azurerm_shared_image_gallery_id" {
  value = azurerm_shared_image_gallery.sig.id
}
output "azurerm_shared_image_gallery_name" {
  value = azurerm_shared_image_gallery.sig.name
}
output "azurerm_resource_group_id" {
  value = azurerm_resource_group.packer_artifacts.id
}
output "azurerm_resource_group_name" {
  value = azurerm_resource_group.packer_artifacts.name
}