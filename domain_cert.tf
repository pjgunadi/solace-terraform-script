resource "solacebroker_domain_cert_authority" "domainCertAuthorities" {
  for_each = {
    for v in var.DomainCertAuthorities : "${v.certAuthorityName}" => v
  }
  
  cert_authority_name = each.value.certAuthorityName
  cert_content = each.value.certContent
}