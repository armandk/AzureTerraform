resource_group_name = "ari-eastus2-prod-core-rg"

load_balancers = {
  loadbalancer1 = {
    name = "app-eastus2-prod-lb-01"
    sku  = "Standard"
    frontend_ips = [
      {
        name        = "app-eastus2-prod-lb-frontendlb-01"
        subnet_name = "eastus2-17566-prod-vnet-02-app-snet-01"
        vnet_name   = "eastus2-17566-prod-vnet-02" 
        static_ip   = null 
        zones       = null
      }
    ]
    backend_pool_names = ["app-eastus2-prod-lb-bp-01"]
    enable_public_ip   = false # set this to true to if you want to create public load balancer
    public_ip_name     = null
  },
  loadbalancer2 = {
    name = "ari-eastus2-prod-elb-01"
    sku  = "Standard"
    frontend_ips = [
      {
        name        = "ari-eastus2-prod-elb-frontendlb-01"
        subnet_name = null
        vnet_name   = "eastus2-17566-prod-vnet-02" 
        static_ip   = null 
        zones       = null
      }
    ]
    backend_pool_names = ["ari-eastus2-prod-elb-bp-01"]
    enable_public_ip   = true # set this to true to if you want to create public load balancer
    public_ip_name     = "ari-eastus2-prod-pip-01"
  },
  loadbalancer3 = {
    name = "ari-eastus2-prod-lb-02"
    sku  = "Standard"
    frontend_ips = [
      {
        name        = "ari-eastus2-prod-lb-frontendlb-02"
        subnet_name = "eastus2-17566-prod-vnet-01-sftp-snet-01"
        vnet_name   = "eastus2-17566-prod-vnet-01" 
        static_ip   = null 
        zones       = null
      }
    ]
    backend_pool_names = ["ari-eastus2-prod-lb-bp-02"]
    enable_public_ip   = false # set this to true to if you want to create public load balancer
    public_ip_name     = null
  },
  loadbalancer4 = {
    name = "ari-eastus2-prod-elb-02"
    sku  = "Standard"
    frontend_ips = [
      {
        name        = "ari-eastus2-prod-elb-frontendlb-02"
        subnet_name = null
        vnet_name   = "eastus2-17566-prod-vnet-01" 
        static_ip   = null 
        zones       = null
      }
    ]
    backend_pool_names = ["ari-eastus2-prod-elb-bp-02"]
    enable_public_ip   = true # set this to true to if you want to create public load balancer
    public_ip_name     = "ari-eastus2-prod-pip-02"
  }
}

load_balancer_rules = {
  loadbalancerrules1 = {
    name                      = "loadbalancerrule1"
    lb_key                    = "loadbalancer1" #Id of the Load Balancer
    frontend_ip_name          = "app-eastus2-prod-lb-frontendlb-01" #It must equals the Lbs front end
    backend_pool_name         = "app-eastus2-prod-lb-bp-01"
    lb_protocol               = null
    lb_port                   = "22"
    probe_port                = "3389"
    backend_port              = "3389"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  }
}

load_balancer_nat_pools = {}

lb_outbound_rules = {
  rule1 = {
    name                            = "ari-prod-elb-rule-01"
    lb_key                          = "loadbalancer2"
    protocol                        = "Tcp"
    backend_pool_name               = "ari-eastus2-prod-elb-bp-01"
    allocated_outbound_ports        = null
    frontend_ip_configuration_names = ["ari-eastus2-prod-elb-frontendlb-01"]
  },
  rule2 = {
    name                            = "ari-prod-elb-rule-02"
    lb_key                          = "loadbalancer4"
    protocol                        = "Tcp"
    backend_pool_name               = "ari-eastus2-prod-elb-bp-02"
    allocated_outbound_ports        = null
    frontend_ip_configuration_names = ["ari-eastus2-prod-elb-frontendlb-02"]
  }
}

load_balancer_nat_rules = {}

lb_additional_tags = {
  iac = "Terraform"
  env = "prod"
}