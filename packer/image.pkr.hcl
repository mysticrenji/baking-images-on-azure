packer {
  required_plugins {
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "azure-arm" "windows" {

  #authentication
    client_id       = var.azure_client_id
    client_secret   = var.azure_client_secret
    subscription_id = var.azure_subscription_id
    tenant_id       = var.azure_tenant_id

  build_resource_group_name              = var.resource_group
  communicator                           = local.communicator[var.azure_os_type]
  image_offer                            = var.azure_managed_image_offer
  image_publisher                        = var.azure_managed_image_publisher
  image_sku                              = var.azure_managed_image_sku
  os_type                                = var.azure_os_type
  vm_size                                = var.azure_vm_size
  winrm_insecure                         = var.winrm_insecure
  winrm_timeout                          = var.winrm_timeout
  winrm_use_ssl                          = var.winrm_use_ssl
  winrm_username                         = var.winrm_username
  managed_image_name                     = var.azure_managed_image_name
  managed_image_resource_group_name      = var.resource_group
  #private_virtual_network_with_public_ip = false


  shared_image_gallery_destination {
    subscription        = var.azure_subscription_id
    resource_group      = var.resource_group
    gallery_name        = var.image_gallery
    image_name          = var.image_name
    image_version       = var.image_version
    replication_regions = [var.replication_regions]
  }
}

build {
  sources = ["source.azure-arm.windows"]
  provisioner "powershell" {
    script = "./scripts/windows/windows-ansible.ps1"
  }
}

//   provisioner "ansible" {
//     playbook_file = "${var.BuildSourcesDirectory}/ansible/windows-image.yml"
//     user          = "packer"
//     use_proxy     = false
//     extra_arguments = [
//       "-v",
//       "-e",
//       "ansible_winrm_server_cert_validation=ignore"
//     ]
//   }

//   provisioner "powershell" {
//     environment_vars = [
//       "delivery=${var.delivery}",
//     ]
//     inline = [
//       "$delivery = $ENV:delivery",
//       "Write-Host \"delivery: $delivery\"",
//       "if ($delivery -eq \"avd\") {",
//       "& $env:SystemRoot\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /quiet /quit",
//       "while($true) { $imageState = Get-ItemProperty HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\State | Select ImageState; if($imageState.ImageState -ne 'IMAGE_STATE_GENERALIZE_RESEAL_TO_OOBE') { Write-Output $imageState.ImageState; Start-Sleep -s 10  } else { break } }",
//       "}"
//     ]
//   }
// }