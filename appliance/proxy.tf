resource "solacebroker_msg_vpn_proxy" "msg_vpn_proxies" {
  for_each = {
    for v in var.MsgVpnProxies : "${v.msgVpnName}.${v.proxyName}" => v
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

resource "solacebroker_proxy" "broker_proxies" {
  for_each = {
    for v in var.BrokerProxies : "${v.proxyName}" => v
  }
  
  proxy_name = each.value.proxyName
  authentication_basic_username = each.value.authenticationBasicUsername
  authentication_basic_password = each.value.authenticationBasicPassword
  authentication_scheme = each.value.authenticationScheme
  enabled = each.value.enabled
  host = each.value.host
  port = each.value.port
  proxy_type = each.value.proxyType

}

# Import
import {
  for_each = {
    for v in var.MsgVpnProxies : "${v.msgVpnName}.${v.proxyName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.proxyName)}" if v._import==true
  }

  to = solacebroker_msg_vpn_proxy.msg_vpn_proxies[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.BrokerProxies : "${v.proxyName}" => "${urlencode(v.proxyName)}" if v._import==true
  }

  to = solacebroker_proxy.broker_proxies[each.key]
  id = each.value
}