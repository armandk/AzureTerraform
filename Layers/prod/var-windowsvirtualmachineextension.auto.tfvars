resource_group_name = null

enable_log_analytics_extension = true
enable_storage_extension       = true

diagnostics_sa_name         = "ariprodstdgatt01"
loganalytics_workspace_name = "ari-eastus2-prod-law" #"ls_nbstf-eastus2-test-law-01"

virtual_machine_extensions = {
  extn1 = {
    virtual_machine_name            = "ari-eastus2-prod-appvm"
    diagnostics_storage_config_path = null # //Terraform//Diagnostics//Config.json" # Optional    
    run_command_script_path         = null #"//pagefile.ps1"
    run_command_script_args         = null #{ region = "eastus2" }
    custom_scripts                  = null
  }
}

ado_subscription_id = null # Change this to NPRD subscription where ADO RG resides when custom script SA is from ADO RG