resource_group_name = null

custom_script_extensions = {
  extn1 = {
    name                 = "changedriveletter"
    virtual_machine_name = "ari-eastus2-prod-appvm"
    command_to_execute   = "rename c:\\azuredata\\customdata.bin customdata.ps1 && powershell -file c:\\azuredata\\customdata.ps1"
  }
}
