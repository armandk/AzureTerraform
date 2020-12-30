resource_group_name = "ari-eastus2-prod-core-rg"

name              = "ari-eastus2-prod-law"
sku               = "PerGB2018"
retention_in_days = 30
key_vault_name    = "ari-prod-kv-01"

log_analytics_additional_tags = {
  iac = "Terraform"
  env = "prod"
}
