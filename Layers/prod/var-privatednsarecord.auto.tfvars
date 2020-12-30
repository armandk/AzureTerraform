resource_group_name = "ari-eastus2-prod-core-rg"

dns_a_records = {
  arecord1 = {
    a_record_name         = "proxy.conexus"                # <"dns+a_record_name">
    dns_zone_name         = "svc.local" # <"dns_zone_name">
    ttl                   = 300                               # <time_to_live_of_the_dns_record_in_seconds>
    ip_addresses          = null                              # <list_of_ipv4_addresses>
    private_endpoint_name = "17566-cnxs03-eastus2-prod-proxy-pe-01"         # <"name of private endpoint for which DNSARecord to be created"
  },
  arecord2 = {
    a_record_name         = "smtp"                # <"dns+a_record_name">
    dns_zone_name         = "az.3pc.att.com" # <"dns_zone_name">
    ttl                   = 300                               # <time_to_live_of_the_dns_record_in_seconds>
    ip_addresses          = null                              # <list_of_ipv4_addresses>
    private_endpoint_name = "17566-cnxs03-eastus2-prod-smtp-pe-01"         # <"name of private endpoint for which DNSARecord to be created"
  },
  arecord3 = {
    a_record_name         = "zlp05390"                # <"dns+a_record_name">
    dns_zone_name         = "vci.att.com" # <"dns_zone_name">
    ttl                   = 300                               # <time_to_live_of_the_dns_record_in_seconds>
    ip_addresses          = null                              # <list_of_ipv4_addresses>
    private_endpoint_name = "17566-cnxs03-eastus2-prod-nva-pe-01"         # <"name of private endpoint for which DNSARecord to be created"
  },
  arecord6 = {
    a_record_name         = "ariprodstbtatt01"                # <"dns+a_record_name">
    dns_zone_name         = "privatelink.blob.core.windows.net" # <"dns_zone_name">
    ttl                   = 300                               # <time_to_live_of_the_dns_record_in_seconds>
    ip_addresses          = null                              # <list_of_ipv4_addresses>
    private_endpoint_name = "17566-cnxs02-eastus2-prod-stbt-blob-01"         # <"name of private endpoint for which DNSARecord to be created"
  },
  arecord7 = {
    a_record_name         = "ariprodstdgatt01"                # <"dns+a_record_name">
    dns_zone_name         = "privatelink.blob.core.windows.net" # <"dns_zone_name">
    ttl                   = 300                               # <time_to_live_of_the_dns_record_in_seconds>
    ip_addresses          = null                              # <list_of_ipv4_addresses>
    private_endpoint_name = "17566-cnxs03-eastus2-prod-btdiag-table-01"        # <"name of private endpoint for which DNSARecord to be created"
  },
  arecord8 = {
    a_record_name         = "ariprodstdgatt01"                # <"dns+a_record_name">
    dns_zone_name         = "privatelink.table.core.windows.net" # <"dns_zone_name">
    ttl                   = 300                               # <time_to_live_of_the_dns_record_in_seconds>
    ip_addresses          = null                              # <list_of_ipv4_addresses>
    private_endpoint_name = "17566-cnxs03-eastus2-prod-vmdiag-blob-01"          # <"name of private endpoint for which DNSARecord to be created"
  },
  arecord9 = {
    a_record_name         = "ari-prod-kv-01"                # <"dns+a_record_name">
    dns_zone_name         = "privatelink.vaultcore.azure.net" # <"dns_zone_name">
    ttl                   = 300                               # <time_to_live_of_the_dns_record_in_seconds>
    ip_addresses          = null                              # <list_of_ipv4_addresses>
    private_endpoint_name = "17566-cnxs03-eastus2-prod-kv-pe-01"         # <"name of private endpoint for which DNSARecord to be created"
  },
  arecord10 = {
    a_record_name         = "odmsvr"             
    dns_zone_name         = "it.att.com" 
    ttl                   = 300                               
    ip_addresses          = null                              
    private_endpoint_name = "17566-cnxs03-eastus2-prod-nva-pe-01"         
  }, 
  arecord11 = {
    a_record_name         = "srmupld"             
    dns_zone_name         = "it.att.com" 
    ttl                   = 300                               
    ip_addresses          = null                              
    private_endpoint_name = "17566-cnxs03-eastus2-prod-smtp-pe-01"         
  }, 
  arecord12 = {
    a_record_name         = "srmupld2"             
    dns_zone_name         = "it.att.com" 
    ttl                   = 300                               
    ip_addresses          = null                              
    private_endpoint_name = "17566-cnxs03-eastus2-prod-smtp-pe-01"         
  },
  arecord13 = {
    a_record_name         = "p4orm1d1"             
    dns_zone_name         = "kmdc.att.com" 
    ttl                   = 300                               
    ip_addresses          = null                              
    private_endpoint_name = "17566-cnxs03-eastus2-prod-nva-pe-01"         
  },
  arecord14 = {
    a_record_name         = "ariprodstatt01"                # <"dns+a_record_name">
    dns_zone_name         = "privatelink.file.core.windows.net" # <"dns_zone_name">
    ttl                   = 300                               # <time_to_live_of_the_dns_record_in_seconds>
    ip_addresses          = null                              # <list_of_ipv4_addresses>
    private_endpoint_name = "17566-cnxs03-eastus2-prod-ariprodstatt01-pe-01"          # <"name of private endpoint for which DNSARecord to be created"
  }
}

dns_arecord_additional_tags = {
  iac = "Terraform"
  env = "prod"
}