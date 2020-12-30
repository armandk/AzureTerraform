resource_group_name = "ari-eastus2-prod-core-rg"

name                            = "ari-prod-kv-01"
enabled_for_deployment          = true
enabled_for_disk_encryption     = true
enabled_for_template_deployment = true
soft_delete_enabled             = true
purge_protection_enabled        = true
sku_name                        = "standard"
secrets                         = {}
access_policies                 = {}
network_acls                    = null

kv_additional_tags = {
  pe_enable = true
  iac       = "Terraform"
  env       = "prod"
}
