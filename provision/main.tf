resource "azurerm_resource_group" "runtime_farm" {
  name     = var.runtime_rg
  location = var.runtime_region
}

resource "azurerm_virtual_network" "runtime_farm_vnet" {
  name                = "runtime-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.runtime_farm.location
  resource_group_name = azurerm_resource_group.runtime_farm.name
}

resource "azurerm_subnet" "runtime_farm_subnet" {
  name                 = "runtime-subnet"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.runtime_farm_vnet.name
  resource_group_name  = azurerm_resource_group.runtime_farm.name
}

resource "azurerm_public_ip" "runtime_farm_public_ip" {
  name                = "runtime-public-ip-${var.machinename}"
  location            = azurerm_resource_group.runtime_farm.location
  resource_group_name = azurerm_resource_group.runtime_farm.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "runtime_nic" {
  name                = "runtime-nic-${var.machinename}"
  location            = azurerm_resource_group.runtime_farm.location
  resource_group_name = azurerm_resource_group.runtime_farm.name

  ip_configuration {
    name                          = "runtime-ipconfig-${var.machinename}"
    subnet_id                     = azurerm_subnet.runtime_farm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.runtime_farm_public_ip.id
  }
}

# Points to Packer build image
data "azurerm_shared_image" "shared_image" {
  name                = var.shared_image_definition
  gallery_name        = var.shared_image_gallery
  resource_group_name = var.shared_image_rg
}

resource "azurerm_virtual_machine" "runtime_machine" {
  name                  = var.machinename
  location              = azurerm_resource_group.runtime_farm.location
  resource_group_name   = azurerm_resource_group.runtime_farm.name
  network_interface_ids = [azurerm_network_interface.runtime_nic.id]

  source_image_id = data.azurerm_image.shared_image.id
  storage_os_disk {
    name              = "${var.machinename}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.machinename
    admin_username = "adminuser"
    admin_password = "AdminPassword1234!"
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  # custom_image_reference {
  #   publisher = "CustomPublisher"
  #   offer     = "CustomOffer"
  #   sku       = "CustomSku"
  #   version   = "CustomVersion"
  # }

  vm_size = "Standard_DS1_v2"
}
