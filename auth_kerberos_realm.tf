resource "solacebroker_msg_vpn_authentication_kerberos_realm" "authenticationKerberosRealm" {
    for_each = {
        for v in var.AuthenticationKerberosRealms : "${v.msgVpnName}.${v.kerberosRealmName}" => v
    }
    msg_vpn_name = each.value.msgVpnName
    kerberos_realm_name = each.value.kerberosRealmName
    enabled = each.value.enabled
    kdc_address = each.value.kdcAddress

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}