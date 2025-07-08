resource "solacebrokerappliance_msg_vpn_mqtt_retain_cache" "mqttRetainCaches" {
  for_each = {
    for v in var.MqttRetainCaches : "${v.msgVpnName}.${v.cacheName}" => v
  }
  
  msg_vpn_name = each.value.msgVpnName
  cache_name = each.value.cacheName
  enabled = each.value.enabled
  msg_lifetime = each.value.msgLifetime

  depends_on = [
    solacebrokerappliance_msg_vpn.msgVpns
  ]
}

# Import
import {
  for_each = {
    for v in var.MqttRetainCaches : "${v.msgVpnName}.${v.cacheName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.cacheName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_mqtt_retain_cache.mqttRetainCaches[each.key]
  id = each.value
}