packer-build-rg     = "golden-image-factory-build"
packer-artifacts-rg = "golden-image-factory-artifacts"
region              = "westus2"
image_gallery       = "golden_image_gallery" #name can only contain alphanumeric, full stops and underscores.
azure_os_type       = "Windows"              # os_type to be one of [Linux Windows]

# Image Definition
azure_managed_image_name               = "en-windows-11"
azure_managed_image_publisher          = "MicrosoftWindowsDesktop"
azure_managed_image_offer              = "office-365"
azure_managed_image_sku                = "win11-21h2-avd-m365"
azure_managed_image_hyper_v_generation = "V1"
