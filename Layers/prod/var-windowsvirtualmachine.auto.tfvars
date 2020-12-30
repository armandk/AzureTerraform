resource_group_name = "ari-eastus2-prod-core-rg"

windows_vms = {
  vm1 = {
    name                             = "ari-eastus2-prod-appvm"
    computer_name                    = "ACE2P17566WS001"
    vm_size                          = "Standard_B2ms"
    assign_identity                  = true
    availability_set_key             = null
    vm_nic_keys                      = ["nic1"]
    lb_backend_pool_names            = ["app-eastus2-prod-lb-bp-01", "ari-eastus2-prod-elb-bp-01"]
    lb_nat_rule_names                = null
    app_security_group_names         = null
    app_gateway_name                 = null
    zone                             = "1"
    subnet_name                      = "eastus2-17566-prod-vnet-02-app-snet-01"
    vnet_name                        = "eastus2-17566-prod-vnet-02"                     #"eastus2-17566-prod-vnet"    
    source_image_reference_offer     = null          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
    source_image_reference_publisher = null          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
    source_image_reference_sku       = null           # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
    source_image_reference_version   = null                 # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer             
    os_disk_name                     = "ari-eastus2-prod-app-os-01"
    storage_os_disk_caching          = "ReadWrite"
    managed_disk_type                = "Premium_LRS"
    disk_size_gb                     = "128"
    write_accelerator_enabled        = null
    internal_dns_name_label          = null
    enable_ip_forwarding             = null # set it to true if you want to enable IP forwarding on the NIC
    enable_accelerated_networking    = null # set it to true if you want to enable accelerated networking
    dns_servers                      = null
    customer_managed_key_name        = null
    disk_encryption_set_name         = "ari-eastus2-prod-appvm01"
    existing_disk_encryption_set_name = null
    existing_disk_encryption_set_rg_name = null
    use_existing_disk_encryption_set = false
    recovery_services_vault_name     = "ari-prod-rsv-01"
    vm_backup_policy_name            = "ari-prod-rsv-policy-01" #"tfex-recovery-vault-policy"
    enable_cmk_disk_encryption       = true # set it to true if you want to enable disk encryption using customer managed key
    enable_automatic_updates         = true
    custom_data_path                 = null #"//drivesetup.ps1" #"//Terraform//Scripts//CustomData.tpl" # Optional
    custom_data_args                 = null #{ region = "eastus2" } #"{ name = "VMandVM", destination = "eastus2", version = "1.0" }
  }
}

windows_vm_nics = {
  nic1 = {
    name                          = "ari-eastus2-prod-app-nic"
    subnet_name                   = "eastus2-17566-prod-vnet-02-app-snet-01"
    vnet_name                     = "eastus2-17566-prod-vnet-02" #"jstartvmfirst"
    networking_resource_group     = null
    internal_dns_name_label       = null
    enable_ip_forwarding          = null # set it to true if you want to enable IP forwarding on the NIC
    enable_accelerated_networking = null # set it to true if you want to enable accelerated networking
    dns_servers                   = null
    nic_ip_configurations = [{
        static_ip = null
        name      = "ari-eastus2-prod-app-ip"
      }
    ]
  }
}

administrator_user_name = "ACE2P17566WS001"
diagnostics_sa_name     = "ariprodstdgatt01"
key_vault_name          = "ari-prod-kv-01"

managed_data_disks = {
  /*"disk1" = {
    disk_name                 = "ari-eastus2-prod-app-data-01"
    vm_key                    = "vm1"
    lun                       = 1
    storage_account_type      = "Premium_LRS"
    disk_size                 = "80"
    caching                   = "None"
    write_accelerator_enabled = false
    create_option             = null
    os_type                   = null
    source_resource_id        = null
  },
  "disk2" = {
    disk_name                 = "ari-eastus2-prod-app-data-02"
    vm_key                    = "vm1"
    lun                       = 2
    storage_account_type      = "Premium_LRS"
    disk_size                 = "400"
    caching                   = "None"
    write_accelerator_enabled = false
    create_option             = null
    os_type                   = null
    source_resource_id        = null
  }*/
}

availability_sets = {}

vm_additional_tags = {
  iac            = "Terraform"
  env            = "prod"
  monitor_enable = true
}
