packer-build-rg     = "golden-image-factory-build"
packer-artifacts-rg = "golden-image-factory-artifacts"
region              = "westus2"
image_gallery       = "golden_image_gallery" #name can only contain alphanumeric, full stops and underscores.

# Image Definition
azure_managed_image_name                                    = "en-windows-2019"
azure_managed_image_publisher                               = "MicrosoftWindowsServer"
azure_managed_image_offer                                   = "WindowsServer"
azure_managed_image_sku                                     = "2019-Datacenter-smalldisk"
azure_managed_image_hyper_v_generation                      = "V1"
azure_shared_image_gallery_destination_storage_account_type = "Standard_LRS"

azure_vm_size         = "Standard_D2ps_v5"
azure_os_type         = "Windows" # os_type to be one of [Linux Windows]
azure_os_disk_size_gb = 48
image_version         = "4.0.0"
image_name            = "en-windows-11"
replication_regions   = "eastus2"