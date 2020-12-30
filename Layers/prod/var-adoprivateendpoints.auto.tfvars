ado_private_endpoints = {
  ape1 = {
    name          = "ari-prod-kv-01"
    resource_name = "ari-prod-kv-01"
    group_ids     = ["vault"]
    dns_zone_name = "privatelink.vaultcore.azure.net"
  }
}

resource_ids = {
  "ari-prod-kv-01" = "/subscriptions/df63d4e4-c5d7-4361-b1de-c88a720c8f9f/resourceGroups/ari-eastus2-prod-core-rg/providers/Microsoft.KeyVault/vaults/ari-prod-kv-01"
}

ado_resource_group_name = "17566-eastus2-devops-rg"
ado_vnet_name           = "17566-eastus2-devops-vnet"
ado_subnet_name         = "17566-eastus2-base-snet"
ado_subscription_id     = "082a50fc-b729-4d5a-81cc-fb1de2d9e93d"

ado_pe_additional_tags = {
  iac = "Terraform"
  env = "prod"
}