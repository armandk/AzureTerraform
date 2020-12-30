resource_group_name = "ari-eastus2-prod-core-rg"

key_vault_name            = "dj-e2-prod-mgmt-kv02"
key_vault_rg_name         = "misc-eastus2-prod-mgmt-rg"
key_vault_subscription_id = "1900060d-c8ef-48d1-9efe-cce24f43c057"

domain_join_extensions = {
  dj1 = {
    secret_name          = "ITServices-Current"
    virtual_machine_name = "ari-eastus2-prod-appvm"
  }
}