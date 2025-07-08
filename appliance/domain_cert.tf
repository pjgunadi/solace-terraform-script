resource "solacebrokerappliance_domain_cert_authority" "domainCertAuthorities" {
  for_each = {
    for v in var.DomainCertAuthorities : "${v.certAuthorityName}" => v
  }
  
  cert_authority_name = each.value.certAuthorityName
  cert_content = each.value.certContent
}

# Import
import {
  for_each = {
    for v in var.DomainCertAuthorities : "${v.certAuthorityName}" => "${urlencode(v.certAuthorityName)}" if v._import==true
  }

  to = solacebrokerappliance_domain_cert_authority.domainCertAuthorities[each.key]
  id = each.value
}
