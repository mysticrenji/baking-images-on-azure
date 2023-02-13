packer-build-rg     = "golden-image-factory-build"
packer-artifacts-rg = "golden-image-factory-artifacts"
region              = "southeastasia"
image_gallery       = "golden_image_gallery" #name can only contain alphanumeric, full stops and underscores.

# Image Definition
azure_managed_image_name                                    = "en-windows-2019"
azure_managed_image_publisher                               = "MicrosoftWindowsServer"
azure_managed_image_offer                                   = "WindowsServer"
azure_managed_image_sku                                     = "2022-datacenter-smalldisk-g2"
azure_shared_image_gallery_destination_storage_account_type = "Standard_LRS"

azure_vm_size         = "Standard_DC1s_v3"
azure_os_type         = "Windows" # os_type to be one of [Linux Windows]
azure_os_disk_size_gb = 48
image_version         = "5.0.0"
image_name            = "en-windows-2019"
replication_regions   = "eastasia"
