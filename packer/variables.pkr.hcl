variable "region" {}
variable "packer-build-rg" {}
variable "packer-artifacts-rg" {}
variable "image_gallery" {}
variable "azure_managed_image_name" {}
variable "azure_os_type" {}
variable "azure_os_disk_size_gb" {}
variable "azure_managed_image_publisher" {}
variable "azure_managed_image_offer" {}
variable "azure_managed_image_sku" {}
variable "azure_managed_image_hyper_v_generation" {}
variable "azure_vm_size" {}
variable "image_name" {}
variable "image_version" {}
variable "replication_regions" {}
variable "azure_client_id" {}
variable "azure_client_secret" {}
variable "azure_subscription_id" {}
variable "azure_tenant_id" {}
variable "azure_shared_image_gallery_destination_storage_account_type" {}
variable "winrm_insecure" {
  description = ""
  type        = bool
  default     = true
}

variable "winrm_timeout" {
  description = ""
  type        = string
  default     = "5m"
}

variable "winrm_use_ssl" {
  description = ""
  type        = bool
  default     = true
}

variable "winrm_username" {
  description = ""
  type        = string
  default     = "packer"
}

locals {
  communicator = {
    Linux   = "ssh"
    Windows = "winrm"
  }
}