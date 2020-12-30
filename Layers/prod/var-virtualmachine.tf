locals {
  linux_image_ids = {
    "ari-eastus2-prod-sftp-vm-01" = "/subscriptions/b1af8825-0fde-44a1-9ebf-63d5bd0410e4/resourceGroups/att-golden-images/providers/Microsoft.Compute/galleries/ATT_Shared_Images/images/RHEL-7"
  }
}

# Diagnostics Extensions
variable "todoapp_image_id" {
  type        = string
  description = "The image id"
  default     = null
}
