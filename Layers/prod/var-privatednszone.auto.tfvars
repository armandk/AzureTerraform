resource_group_name = "ari-eastus2-prod-core-rg"

private_dns_zones = {
  zone1 = {
    dns_zone_name = "privatelink.file.core.windows.net"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone2 = {
    dns_zone_name = "privatelink.blob.core.windows.net"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone3 = {
    dns_zone_name = "privatelink.table.core.windows.net"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone4 = {
    dns_zone_name = "privatelink.vaultcore.azure.net"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone5 = {
    dns_zone_name = "svc.local"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone6 = {
    dns_zone_name = "az.3pc.att.com"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = true
  },
  zone7 = {
    dns_zone_name = "kmdc.att.com"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone8 = {
    dns_zone_name = "privatelink.monitor.azure.com"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone9 = {
    dns_zone_name = "vci.att.com"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone10 = {
    dns_zone_name = "it.att.com"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      },
      {
        zone_to_vnet_link_name   = "second-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-02"
        zone_to_vnet_link_exists = false
      }
    ]
    registration_enabled = false
  },
  zone11 = {
    dns_zone_name = "itservices.sbc.com"
    zone_exists   = false
    vnet_links = [
      {
        zone_to_vnet_link_name   = "first-vnet-link"
        vnet_name                = "eastus2-17566-prod-vnet-01"
        zone_to_vnet_link_exists = false
      }]
    registration_enabled = false
  }
}

dns_zone_additional_tags = {
  iac = "Terraform"
  env = "prod"
}