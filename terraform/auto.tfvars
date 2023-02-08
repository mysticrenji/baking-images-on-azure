packer-build-rg     = "golden-image-factory-build"
packer-artifacts-rg = "golden-image-factory-artifacts"
region              = "westus2"
image_gallery       = "golden_image_gallery" #name can only contain alphanumeric, full stops and underscores.
azure_os_type       = "Windows"              # os_type to be one of [Linux Windows]

# Image Definition
azure_managed_image_name               = "en-windows-2022-small"
azure_managed_image_publisher          = "PRWindowsServer"
azure_managed_image_offer              = "windows-2019"
azure_managed_image_sku                = "win2019-21h2-en"
azure_managed_image_hyper_v_generation = "V1"
