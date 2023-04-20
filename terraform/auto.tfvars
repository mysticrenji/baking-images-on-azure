packer-build-rg     = "golden-image-factory-build"
packer-artifacts-rg = "golden-image-factory-artifacts"
region              = "westeurope"
image_gallery       = "golden_image_gallery" # name can only contain alphanumeric, full stops and underscores.
azure_os_type       = "Windows"              # os_type to be one of [Linux Windows]

# Image Definition
azure_managed_image_name               = "en-windows-2019"
azure_managed_image_publisher          = "MicrosoftWindowsServer"
azure_managed_image_offer              = "WindowsServer"
azure_managed_image_sku                = "2019-Datacenter-smalldisk"
azure_managed_image_hyper_v_generation = "V2"
