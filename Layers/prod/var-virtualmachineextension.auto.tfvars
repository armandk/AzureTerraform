resource_group_name = "ari-eastus2-prod-core-rg" #"jstart-vm-dev-113020"

enable_log_analytics_extension   = true
enable_storage_extension         = true
enable_network_watcher_extension = true

diagnostics_sa_name         = "ariprodstdgatt01"
loganalytics_workspace_name = "ari-eastus2-prod-law"  #"jstartvmdev113020law"


virtual_machine_extensions = {
  extn1 = {
    virtual_machine_name            = "ari-eastus2-prod-sftp-vm-01"
    diagnostics_storage_config_path = null #"/Diagnostics/config.json" # Optional
    custom_scripts = [
      {
        name                 = "vmjumpxtensionfirst"
        command_to_execute   = "ls"
        script_path          = null
        script_args          = null
        file_uris            = null
        storage_account_name = null
        resource_group_name  = null
      }
    ]
  }
}

ado_subscription_id = null # Change this to NPRD subscription where ADO RG resides when custom script SA is from ADO RG