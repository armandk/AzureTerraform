resource_group_name = "ari-eastus2-prod-core-rg"

linux_vms = {
  vm1 = {
    name                             = "ari-eastus2-prod-sftp-vm-01"
    vm_size                          = "Standard_DS1_v2"
    assign_identity                  = true
    availability_set_key             = null
    vm_nic_keys                      = ["nic1"]
    lb_backend_pool_names            = ["ari-eastus2-prod-lb-bp-02","ari-eastus2-prod-elb-bp-02"]
    lb_nat_rule_names                = null
    app_security_group_names         = null
    app_gateway_name                 = null
    zone                             = "1"
    disable_password_authentication  = true
    source_image_reference_offer     = null     # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
    source_image_reference_publisher = null   # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
    source_image_reference_sku       = null    # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
    source_image_reference_version   = null   # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer             
    os_disk_name                     = null  #"osdisklin113020"
    storage_os_disk_caching          = "ReadWrite"
    managed_disk_type                = "Premium_LRS"
    disk_size_gb                     = "128"
    write_accelerator_enabled        = null
    recovery_services_vault_name     = "ari-prod-rsv-01"
    vm_backup_policy_name            = null  #"asks-recovery-vault-policy" #"tfex-recovery-vault-policy"
    customer_managed_key_name        = null
    disk_encryption_set_name         = "ari-eastus2-prod-sftp-vm-des-01"
    existing_disk_encryption_set_name = null
    existing_disk_encryption_set_rg_name = null
    ultra_ssd_enabled                = null
    use_existing_disk_encryption_set = false
    enable_cmk_disk_encryption       = true # set it to true if you want to enable disk encryption using customer managed key
    custom_data_path                 = null #"//Terraform//Scripts//CustomData.tpl" # Optional
    custom_data_args                 = null #"{ name = "VMandVM", destination = "westus2", version = "1.0" }
  }
}


availability_sets = {}

linux_vm_nics = {
  nic1 = {
    name                          = "ari-eastus2-prod-sftp-nic-01"
    subnet_name                   = "eastus2-17566-prod-vnet-01-sftp-snet-01"
    vnet_name                     = null #"jstartvmfirst"
    networking_resource_group     = null
    internal_dns_name_label       = null
    enable_ip_forwarding          = null # set it to true if you want to enable IP forwarding on the NIC
    enable_accelerated_networking = null # set it to true if you want to enable accelerated networking
    dns_servers                   = null
    nic_ip_configurations = [
      {
        static_ip = null
        name      = "ari-eastus2-prod-sftp-ip-001"
      }
    ]
  }
}

administrator_user_name      = "ariadmin"
administrator_login_password = null

diagnostics_sa_name = "ariprodstdgatt01"
key_vault_name      = "ari-prod-kv-01" #"jstartvmdev113020kv"

managed_data_disks = {}

vm_additional_tags = {
  iac            = "Terraform"
  env            = "Prod"
  monitor_enable = true
}
