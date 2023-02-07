locals {
  tags = {
    environment = "prod"
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.region
}

resource "azurerm_shared_image_gallery" "sig" {
  name                = var.image_gallery
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  description         = "Golden Image Gallery"

}

resource "azurerm_shared_image" "windows" {
  name                = var.azure_managed_image_name
  gallery_name        = azurerm_shared_image_gallery.sig.name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  os_type             = var.azure_os_type

  identifier {
    publisher = var.azure_managed_image_publisher
    offer     = var.azure_managed_image_offer
    sku       = var.azure_managed_image_sku
  }

  hyper_v_generation = var.azure_managed_image_hyper_v_generation
}
