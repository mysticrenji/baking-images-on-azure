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

resource "azurerm_windows_virtual_machine" "runtime_machine" {
  name                = var.machinename
  resource_group_name = azurerm_resource_group.runtime_farm.name
  location            = azurerm_resource_group.runtime_farm.location
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.runtime_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_id = data.azurerm_shared_image.shared_image.id

}
