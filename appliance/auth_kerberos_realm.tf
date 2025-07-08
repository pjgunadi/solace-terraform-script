resource "solacebrokerappliance_msg_vpn_authentication_kerberos_realm" "authenticationKerberosRealm" {
    for_each = {
        for v in var.AuthenticationKerberosRealms : "${v.msgVpnName}.${v.kerberosRealmName}" => v
    }
    msg_vpn_name = each.value.msgVpnName
    kerberos_realm_name = each.value.kerberosRealmName
    enabled = each.value.enabled
    kdc_address = each.value.kdcAddress

  depends_on = [
    solacebrokerappliance_msg_vpn.msgVpns
  ]
}

# Import
import {
  for_each = {
        for v in var.AuthenticationKerberosRealms : "${v.msgVpnName}.${v.kerberosRealmName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.kerberosRealmName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_authentication_kerberos_realm.authenticationKerberosRealm[each.key]
  id = each.value
}