resource_group = "golden-image-factory"
region         = "westus2"
image_gallery  = "golden_image_gallery" #name can only contain alphanumeric, full stops and underscores.

# Image Definition
azure_managed_image_name               = "en-windows-11"
azure_managed_image_publisher          = "MicrosoftWindowsDesktop"
azure_managed_image_offer              = "office-365"
azure_managed_image_sku                = "win11-21h2-avd-m365"
azure_managed_image_hyper_v_generation = "V1"

azure_vm_size       = "Standard_Ds2_v2"
azure_os_type       = "Windows" # os_type to be one of [Linux Windows]
image_version       = "1.0.0"
image_name          = "windows-2019-en"
replication_regions = "westus2"