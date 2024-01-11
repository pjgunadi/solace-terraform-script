resource "solacebroker_msg_vpn_proxy" "proxies" {
  for_each = {
    for v in var.Proxies : "${v.msgVpnName}.${v.proxyName}" => v
  }
  
  msg_vpn_name = each.value.msgVpnName
  proxy_name = each.value.proxyName
  authentication_basic_username = each.value.authenticationBasicUsername
  authentication_basic_password = each.value.authenticationBasicPassword
  authentication_scheme = each.value.authenticationScheme
  enabled = each.value.enabled
  host = each.value.host
  port = each.value.port
  proxy_type = each.value.proxyType

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}