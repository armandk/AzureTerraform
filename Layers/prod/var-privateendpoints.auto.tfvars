resource_group_name = "ari-eastus2-prod-core-rg"


private_endpoints = {
  pe1 = {
    resource_name            = "keyvault"
    name                     = "17566-cnxs03-eastus2-prod-kv-pe-01"
    subnet_name              = "eastus2-17566-prod-vnet-01-pe-snet-01"
    vnet_name                = "eastus2-17566-prod-vnet-01"
    approval_required        = false
    approval_message         = "Auto Approved"
    group_ids                = ["vault"]
  },
  pe2 = {
    resource_name            = "VMDiagPE"
    name                     = "17566-cnxs03-eastus2-prod-vmdiag-blob-01"
    subnet_name              = "eastus2-17566-prod-vnet-01-pe-snet-01"
    vnet_name                = "eastus2-17566-prod-vnet-01"
    approval_required        = false
    approval_message         = "Auto Approved"
    group_ids                = ["blob"]
  },
  pe3 = {
    resource_name            = "BootDiagPE"
    name                     = "17566-cnxs03-eastus2-prod-btdiag-table-01"
    subnet_name              = "eastus2-17566-prod-vnet-01-pe-snet-01"
    vnet_name                = "eastus2-17566-prod-vnet-01"
    approval_required        = false
    approval_message         = "Auto Approved"
    group_ids                = ["table"]
  },
  pe4 = {
    resource_name            = "nva"
    name                     = "17566-cnxs03-eastus2-prod-nva-pe-01"
    subnet_name              = "eastus2-17566-prod-vnet-01-pe-snet-01"
    vnet_name                = "eastus2-17566-prod-vnet-01"
    approval_required        = true
    approval_message         = "Please approve my private endpoint connection request for NVA"
    group_ids                = []
  },
  pe5 = {
    resource_name            = "smtp"
    name                     = "17566-cnxs03-eastus2-prod-smtp-pe-01"
    subnet_name              = "eastus2-17566-prod-vnet-01-pe-snet-01"
    vnet_name                = "eastus2-17566-prod-vnet-01"
    approval_required        = true
    approval_message         = "Please approve my private endpoint connection request for SMTP"
    group_ids                = []
  },
  pe6 = {
    resource_name            = "DBBackupPE"
    name                     = "17566-cnxs02-eastus2-prod-stbt-blob-01"
    subnet_name              = "eastus2-17566-prod-vnet-01-pe-snet-01"
    vnet_name                = "eastus2-17566-prod-vnet-01"
    approval_required        = false
    approval_message         = "Please approve my private endpoint connection request for PCMP"
    group_ids                = ["blob"]
  }
  pe7 = {
    resource_name            = "Squid"
    name                     = "17566-cnxs03-eastus2-prod-proxy-pe-01"
    subnet_name              = "eastus2-17566-prod-vnet-01-pe-snet-01"
    vnet_name                = "eastus2-17566-prod-vnet-01"
    approval_required        = true
    approval_message         = "Please approve my private endpoint connection request for NVA"
    group_ids                = []
  },
  pe9 = {
    resource_name            = "FileStoragePE"
    name                     = "17566-cnxs03-eastus2-prod-ariprodstatt01-pe-01"
    subnet_name              = "eastus2-17566-prod-vnet-01-sftp-snet-01"
    vnet_name                = "eastus2-17566-prod-vnet-01"
    approval_required        = false
    approval_message         = "Auto Approved"
    group_ids                = ["file"]
  }
}


resource_ids = {
    smtp         = "/subscriptions/7eb51ca3-6c6a-4b62-a476-763c7d336385/resourceGroups/rbss01-eastus2-lb-rg-001/providers/Microsoft.Network/privateLinkServices/30050-rbss01-eastus2-001-smtp-proxy-pls"
    VMDiagPE     = "/subscriptions/df63d4e4-c5d7-4361-b1de-c88a720c8f9f/resourceGroups/ari-eastus2-prod-core-rg/providers/Microsoft.Storage/storageAccounts/ariprodstdgatt01"
    BootDiagPE   = "/subscriptions/df63d4e4-c5d7-4361-b1de-c88a720c8f9f/resourceGroups/ari-eastus2-prod-core-rg/providers/Microsoft.Storage/storageAccounts/ariprodstdgatt01"
    DBBackupPE   = "/subscriptions/df63d4e4-c5d7-4361-b1de-c88a720c8f9f/resourceGroups/ari-eastus2-prod-core-rg/providers/Microsoft.Storage/storageAccounts/ariprodstbtatt01"
    keyvault     = "/subscriptions/df63d4e4-c5d7-4361-b1de-c88a720c8f9f/resourceGroups/ari-eastus2-prod-core-rg/providers/Microsoft.KeyVault/vaults/ari-prod-kv-01"
    nva          = "/subscriptions/7eb51ca3-6c6a-4b62-a476-763c7d336385/resourceGroups/cnxs03-eastus2-lb-rg-001/providers/Microsoft.Network/privateLinkServices/30050-cnxs03-eastus2-001-proxy-pls"
    Squid        = "/subscriptions/7eb51ca3-6c6a-4b62-a476-763c7d336385/resourceGroups/cnxs03-eastus2-lb-rg-001/providers/Microsoft.Network/privateLinkServices/30050-cnxs03-eastus2-001-proxy-pls"
    FileStoragePE = "/subscriptions/df63d4e4-c5d7-4361-b1de-c88a720c8f9f/resourceGroups/ari-eastus2-prod-core-rg/providers/Microsoft.Storage/storageAccounts/ariprodstatt01"
}

external_resource_ids = {}

pe_additional_tags = {
  iac = "Terraform"
  env = "prod"
}
