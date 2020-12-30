resource_group_name = "ari-eastus2-prod-core-rg"

private_link_services = {
  pls1 = {
    name                           = "17566-eastus2-prod-App-pls-01" # "<private_link_service_name>"
    loadbalancer_name              = "app-eastus2-prod-lb-01"       #"jstartvmlb1"         # "<loadbalancer_name>"
    frontend_ip_config_name        = "app-eastus2-prod-lb-frontendlb-01"  # "<lb_frontend_name>"
    subnet_name                    = "eastus2-17566-prod-vnet-02-pls-snet-01"               # "<subnet_name>"
    vnet_name                      = "eastus2-17566-prod-vnet-02"                  #"jstartvmssfirst"      # "<vnet_name>"
    private_ip_address             = null                 # "<private_ip_address>"
    private_ip_address_version     = "IPv4"                # "<private_ip_address_version>"
    visibility_subscription_ids    = null                  # <["00000000-0000-0000-0000-000000000000"]>
    auto_approval_subscription_ids = null                  # <["00000000-0000-0000-0000-000000000000"]>
    enable_proxy_protocol          = null
  },
  pls3 = {
    name                           = "17566-eastus2-prod-sftp-pls-02" # "<private_link_service_name>"
    loadbalancer_name              = "ari-eastus2-prod-lb-02"       #"jstartvmlb1"         # "<loadbalancer_name>"
    frontend_ip_config_name        = "ari-eastus2-prod-lb-frontendlb-02"  # "<lb_frontend_name>"
    subnet_name                    = "eastus2-17566-prod-vnet-01-sftp-snet-01"               # "<subnet_name>"
    vnet_name                      = "eastus2-17566-prod-vnet-01"                  #"jstartvmssfirst"      # "<vnet_name>"
    private_ip_address             = null                 # "<private_ip_address>"
    private_ip_address_version     = "IPv4"                # "<private_ip_address_version>"
    visibility_subscription_ids    = null                  # <["00000000-0000-0000-0000-000000000000"]>
    auto_approval_subscription_ids = null                  # <["00000000-0000-0000-0000-000000000000"]>
    enable_proxy_protocol          = null
  }
}

pls_additional_tags = {
  iac = "Terraform"
  env = "prod"
}
