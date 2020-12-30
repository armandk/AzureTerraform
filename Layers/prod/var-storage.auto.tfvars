resource_group_name = "ari-eastus2-prod-core-rg"

storage_accounts = {
  sa1 = {
    name                       = "ariprodstdgatt01"
    sku                        = "Standard_RAGRS"
    account_kind               = null
    access_tier                = null
    assign_identity            = true
    cmk_enable                 = true
    network_rules              = null
    enable_large_file_share    = false
  },
  sa2 = {
    name                       = "ariprodstbtatt01"
    sku                        = "Standard_RAGRS"
    account_kind               = null
    access_tier                = null
    assign_identity            = true
    cmk_enable                 = true
    network_rules              = null
    enable_large_file_share    = false
  },
  sa3 = {
    name                       = "ariprodstatt01"
    sku                        = "Standard_RAGRS"
    account_kind               = null
    access_tier                = null
    assign_identity            = true
    cmk_enable                 = true
    network_rules              = null
    enable_large_file_share    = false
  }
}

file_shares = {}

tables = {}

ado_private_endpoints = {}

ado_resource_group_name = "17566-eastus2-devops-rg"
ado_vnet_name           = "17566-eastus2-devops-vnet"
ado_subnet_name         = "17566-eastus2-base-snet"
ado_subscription_id     = "082a50fc-b729-4d5a-81cc-fb1de2d9e93d"

key_vault_name = null #"lsnbstf-prod-kv-02"

sa_additional_tags = {
  iac       = "Terraform"
  env       = "prod"
  pe_enable = true
}