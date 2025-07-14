resource "solacebroker_client_cert_authority" "clientCertAuthorities" {
  for_each = {
    for v in var.ClientCertAuthorities : "${v.certAuthorityName}" => v
  }
    cert_authority_name = each.value.certAuthorityName
    cert_content = each.value.certContent
    crl_day_list = each.value.crlDayList
    crl_time_list = each.value.crlTimeList
    crl_url = each.value.crlUrl
    ocsp_non_responder_cert_enabled = each.value.ocspNonResponderCertEnabled
    ocsp_override_url = each.value.ocspOverrideUrl
    ocsp_timeout = each.value.ocspTimeout
    revocation_check_enabled = each.value.revocationCheckEnabled
}

resource "solacebroker_client_cert_authority_ocsp_tls_trusted_common_name" "ocspTlsTrustedCommonNames" {
  for_each = {
    for v in var.OcspTlsTrustedCommonNames : "${v.certAuthorityName}.${v.ocspTlsTrustedCommonNames}" => v
  }
  cert_authority_name = each.value.certAuthorityName
  ocsp_tls_trusted_common_name = each.value.ocspTlsTrustedCommonName
  depends_on = [
    solacebroker_client_cert_authority.clientCertAuthorities
  ]
}

# Import
import {
  for_each = {
    for v in var.ClientCertAuthorities : "${v.certAuthorityName}" => "${urlencode(v.certAuthorityName)}" if v._import==true
  }

  to = solacebroker_client_cert_authority.clientCertAuthorities[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.OcspTlsTrustedCommonNames : "${v.certAuthorityName}.${v.ocspTlsTrustedCommonNames}" => "${urlencode(v.certAuthorityName)}/${urlencode(v.ocspTlsTrustedCommonNames)}" if v._import==true
  }

  to = solacebroker_client_cert_authority_ocsp_tls_trusted_common_name.ocspTlsTrustedCommonNames[each.key]
  id = each.value
}
  