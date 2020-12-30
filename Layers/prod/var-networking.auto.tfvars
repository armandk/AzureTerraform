resource_group_name = "ari-eastus2-prod-core-rg"
net_location        = null

virtual_networks = {
  virtualnetwork1 = {
    name                 = "eastus2-17566-prod-vnet-02"
    address_space        = ["10.254.131.0/27"]
    dns_servers          = null
    ddos_protection_plan = null
  },
  virtualnetwork2 = {
    name                 = "eastus2-17566-prod-vnet-01"
    address_space        = ["10.0.0.0/16"]
    dns_servers          = null
    ddos_protection_plan = null
  }
}

vnet_peering = {
  peering1={
    destination_vnet_name          = "eastus2-17566-prod-vnet-02"
    destination_vnet_rg            = "ari-eastus2-prod-core-rg"
    vnet_key                       = "virtualnetwork2"
    allow_virtual_network_access   = true
    allow_forwarded_traffic        = true
    allow_gateway_transit          = true
    use_remote_gateways            = false
  }
}

subnets = {
  subnet1 = {
    vnet_key          = "virtualnetwork1" #pls
    nsg_key           = "nsg1"
    rt_key            = null
    name              = "eastus2-17566-prod-vnet-02-pls-snet-01"
    address_prefixes  = ["10.254.131.0/28"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet2 = {
    vnet_key          = "virtualnetwork1" #app
    nsg_key           = "nsg4"
    rt_key            = null
    name              = "eastus2-17566-prod-vnet-02-app-snet-01"
    address_prefixes  = ["10.254.131.16/28"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet3 = {
    vnet_key          = "virtualnetwork2" #pls
    nsg_key           = "nsg2"
    rt_key            = null
    name              = "eastus2-17566-prod-vnet-01-pls-snet-01"
    address_prefixes  = ["10.0.2.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet4 = {
    vnet_key          = "virtualnetwork2" #pe
    nsg_key           = "nsg3"
    rt_key            = null
    name              = "eastus2-17566-prod-vnet-01-pe-snet-01"
    address_prefixes  = ["10.0.3.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet5 = {
    vnet_key          = "virtualnetwork2"
    nsg_key           = "nsg5"
    rt_key            = null
    name              = "eastus2-17566-prod-vnet-01-sftp-snet-01"
    address_prefixes  = ["10.0.5.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  }
}

network_security_groups = {
  nsg1 = {
    name = "ari-prod-pls-nsg-01"
    tags = { log_workspace = "ari-eastus2-prod-law" }
      security_rules = [
        {
        name                                         = "Port_3389"
        description                                  = "Allow RDP"
        priority                                     = 100
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "3389"
        destination_port_ranges                      = null
        source_address_prefix                        = "VirtualNetwork"
        source_address_prefixes                      = null
        destination_address_prefix                   = "VirtualNetwork"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      }
    ]
  },
  nsg4 = {
    name = "ari-prod-app-nsg-01"
    tags = { log_workspace = "ari-eastus2-prod-law" }
      security_rules = [
      {
        name                                         = "IBA-RDP-Any-WW"
        description                                  = "IBA-RDP-Any-WW"
        priority                                     = 105
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "3389"
        destination_port_ranges                      = null
        source_address_prefix                        = "135.170.44.0/24"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.254.131.16/28"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "IBS-WSS-Any-Tools"
        description                                  = "IBS-WSS-Any-Tools"
        priority                                     = 110
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = null
        destination_port_ranges                      = ["135","445","49152-65535"]
        source_address_prefix                        = "135.170.44.0/24"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.254.131.16/28"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "IBS-RDP-Any-WW"
        description                                  = "IBS-RDP-Any-WW"
        priority                                     = 115
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "3389"
        destination_port_ranges                      = null
        source_address_prefix                        = "135.170.44.128/26"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.254.131.16/28"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "IBD-Any-Any-Any"
        description                                  = "IBD-Any-Any-Any"
        priority                                     = 4096
        direction                                    = "Inbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "*"
        source_address_prefixes                      = null
        destination_address_prefix                   = "*"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "Azure-Monitor-Log-Analytics"
        description                                  = "Egress all traffic to Azure Monitor Service"
        priority                                     = 200
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = null
        destination_port_ranges                      = ["80","443"]
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "AzureMonitor"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "Guest-Hybrid-management"
        description                                  = "Egress all traffic to Guest and Hybird Management"
        priority                                     = 205
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "443"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "GuestAndHybridManagement"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "Azure-Active-Directory"
        description                                  = "Egress all traffic to Azure Active Directory"
        priority                                     = 210
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "443"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "AzureActiveDirectory"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "App-key-vault"
        description                                  = "Egress from app subnet to the Azure Key Vault"
        priority                                     = 215
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "443"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.3.0/24"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "App-DB-Subnet"
        description                                  = "Egress from app subnet to db subnet for application functionatlity"
        priority                                     = 220
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_ranges                      = ["1521","1522","1831","1832"]
        destination_port_range                       = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.4.0/24"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "App-Pe-Subnet"
        description                                  = "Egress non-https traffic through NVA proxy back to Conexus"
        priority                                     = 225
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.3.0/24"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "OBA-Any-Any-DomainController"
        description                                  = "OBA-Any-Any-DomainController"
        priority                                     = 230
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "135.170.44.0/28"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "OBA-Any-Any-SCCM"
        description                                  = "OBA-Any-Any-SCCM"
        priority                                     = 235
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "135.170.44.16/28"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "OBA-Any-Any-SCOM"
        description                                  = "OBA-Any-Any-SCOM"
        priority                                     = 240
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "135.170.44.32/27"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "OBA-HTTPS-CloudPassage"
        description                                  = "OBA-HTTPS-CloudPassage"
        priority                                     = 245
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "443"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = null
        destination_address_prefixes                 = ["34.208.11.33","52.39.65.180","34.208.32.77"]
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "OBA-HTTPS-SentinelOne"
        description                                  = "OBA-HTTPS-SentinelOne"
        priority                                     = 250
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "443"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = null
        destination_address_prefixes                 = ["3.226.115.208","3.224.192.9"]
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "OBA-To-NVA-PE"
        description                                  = "OBA-To-NVA-PE"
        priority                                     = 255
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "443"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "135.170.88.186"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "OBD-Any-Any-Any"
        description                                  = "OBD-Any-Any-Any"
        priority                                     = 4096
        direction                                    = "Outbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "*"
        source_address_prefixes                      = null
        destination_address_prefix                   = "*"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "IB-SSH-Traffic"
        description                                  = "Ingress SSH traffic from Jump subnet to app subnet"
        priority                                     = 1000
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = null
        destination_port_ranges                      = ["22","3389"]
        source_address_prefix                        = "10.254.131.0/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.254.131.16/28"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "Block-Internet"
        description                                  = "Block all Internet Traffic"
        priority                                     = 4000
        direction                                    = "Outbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.254.131.16/28"
        source_address_prefixes                      = null
        destination_address_prefix                   = "Internet"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "Allow-Inbound-Azure-LB"
        description                                  = "Allow inbound from Azure Load Balancer"
        priority                                     = 4040
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "AzureLoadBalancer"
        source_address_prefixes                      = null
        destination_address_prefix                   = "VirtualNetwork"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "Block-traffic"
        description                                  = "Block all remaining inbound traffic"
        priority                                     = 4050
        direction                                    = "Inbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "VirtualNetwork"
        source_address_prefixes                      = null
        destination_address_prefix                   = "VirtualNetwork"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "Block-remaining-traffic"
        description                                  = "Block all remaining outbound traffic"
        priority                                     = 4050
        direction                                    = "Outbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "VirtualNetwork"
        source_address_prefixes                      = null
        destination_address_prefix                   = "VirtualNetwork"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      }
    ]
  },
  nsg2 = { # PE NSG
    name = "ari-prod-pls-nsg-02"
    tags = { log_workspace = "ari-eastus2-prod-law" }
    security_rules = []
  },
  nsg3 = { # PE NSG
    name = "ari-prod-pe-nsg-01"
    tags = { log_workspace = "ari-eastus2-prod-law" }
    security_rules = []
  }
  nsg5 = {
    name = "ari-prod-sftp-nsg-01"
    tags = { log_workspace = "ari-eastus2-prod-law" }
    security_rules = []
    security_rules = [
      {
        name                         = "Azure_Monitor_sftp"
        description                  = "Egress all traffic to Azure Monitor"
        priority                     = 200
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "*"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = ""
        destination_port_ranges      = [ "443","80" ]
        source_address_prefix        = "VirtualNetwork"
        source_address_prefixes      = null
        destination_address_prefix   = "AzureMonitor"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "Azure_Monitor_Log_Analytics_sftp"
        description                  = "Egress all traffic to Guest and Hybird Management"
        priority                     = 205
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "*"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "443"
        destination_port_ranges      = null
        source_address_prefix        = "VirtualNetwork"
        source_address_prefixes      = null
        destination_address_prefix   = "GuestAndHybridManagement"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "Azure_Active_Directory_sftp"
        description                  = "Egress all traffic to Azure Active Directory"
        priority                     = 210
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "*"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "*"
        destination_port_ranges      = null
        source_address_prefix        = "VirtualNetwork"
        source_address_prefixes      = null
        destination_address_prefix   = "AzureActiveDirectory"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "sftp_to_Azure_PE"
        description                  = "Egress from sftp subnet to the Azure Key Vault Private Endpoint, Storage Private Endpoint(s), SQUID Proxy Private Endpoint"
        priority                     = 215
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "*"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "443"
        destination_port_ranges      = null
        source_address_prefix        = "*"
        source_address_prefixes      = null
        destination_address_prefix   = "10.0.3.0/24"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "SSH2_sftp"
        description                  = "Ingress ssh from Jump Subnet to sftp Subnet"
        priority                     = 1010
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "22"
        destination_port_ranges      = null
        source_address_prefix        = "10.0.4.0/24"
        source_address_prefixes      = null
        destination_address_prefix   = "*"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "Https_sftp"
        description                  = "Ingress https traffic from Conexus to sftp subnet (users accessing application front end) "
        priority                     = 1000
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "443"
        destination_port_ranges      = null
        source_address_prefix        = "*"
        source_address_prefixes      = null
        destination_address_prefix   = "*"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "http_sftp"
        description                  = "Ingress http from pls subnet to sftp"
        priority                     = 1020
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "80"
        destination_port_ranges      = null
        source_address_prefix        = "*"
        source_address_prefixes      = null
        destination_address_prefix   = "*"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "sftp_fileshare"
        description                  = "For SFTP server to Access Fileshare"
        priority                     = 1030
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "445"
        destination_port_ranges      = null
        source_address_prefix        = "*"
        source_address_prefixes      = null
        destination_address_prefix   = "*"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "Block_Internet_sftp"
        description                  = "Block all Internet Traffic"
        priority                     = 4000
        direction                    = "Outbound"
        access                       = "Deny"
        protocol                     = "*"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "*"
        destination_port_ranges      = null
        source_address_prefix        = "*"
        source_address_prefixes      = null
        destination_address_prefix   = "Internet"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                         = "Allow_LB_sftp"
        description                  = "Allow inbound from Azure Load Balancer"
        priority                     = 4040
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "*"
        source_port_range            = "*"
        source_port_ranges           = null
        destination_port_range       = "*"
        destination_port_ranges      = null
        source_address_prefix        = "VirtualNetwork"
        source_address_prefixes      = null
        destination_address_prefix   = "*"
        destination_address_prefixes = null
        source_application_security_group_names      = []
        destination_application_security_group_names = []        
      },
      {
        name                                         = "OBD-Any-Any-Any"
        description                                  = "OBD-Any-Any-Any"
        priority                                     = 4050
        direction                                    = "Outbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "*"
        source_address_prefixes                      = null
        destination_address_prefix                   = "*"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      },
      {
        name                                         = "IBD-Any-Any-Any"
        description                                  = "OBD-Any-Any-Any"
        priority                                     = 4050
        direction                                    = "Inbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "*"
        source_address_prefixes                      = null
        destination_address_prefix                   = "*"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      }
    ]
  }
}

net_additional_tags = {
  iac = "Terraform"
  env = "prod"
}