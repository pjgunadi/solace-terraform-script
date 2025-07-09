resource "solacebroker_msg_vpn_bridge" "bridges" {
  for_each = {
    for v in var.Bridges : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}" => v
  }

    bridge_name = each.value.bridgeName
    bridge_virtual_router = each.value.bridgeVirtualRouter
    msg_vpn_name = each.value.msgVpnName
    enabled = each.value.enabled
    max_ttl = each.value.maxTtl
    remote_authentication_basic_client_username = each.value.remoteAuthenticationBasicClientUsername
    remote_authentication_basic_password = each.value.remoteAuthenticationBasicPassword
    remote_authentication_client_cert_content = each.value.remoteAuthenticationClientCertContent
    remote_authentication_client_cert_password = each.value.remoteAuthenticationClientCertPassword
    remote_authentication_scheme = each.value.remoteAuthenticationScheme
    remote_connection_retry_count = each.value.remoteConnectionRetryCount
    remote_connection_retry_delay = each.value.remoteConnectionRetryDelay
    remote_deliver_to_one_priority = each.value.remoteDeliverToOnePriority
    tls_cipher_suite_list = each.value.tlsCipherSuiteList

  depends_on = [
    solacebroker_msg_vpn.msgVpns,
  ]
}

resource "solacebroker_msg_vpn_bridge_remote_msg_vpn" "remoteMsgVpns" {
  for_each = {
    for v in var.RemoteMsgVpns : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}.${v.remoteMsgVpnName}.${v.remoteMsgVpnLocation}.${v.remoteMsgVpnInterface}" => v
  }
  
    bridge_name = each.value.bridgeName
    bridge_virtual_router = each.value.bridgeVirtualRouter
    msg_vpn_name = each.value.msgVpnName
    remote_msg_vpn_name = each.value.remoteMsgVpnName
    remote_msg_vpn_location = each.value.remoteMsgVpnLocation
    remote_msg_vpn_interface = each.value.remoteMsgVpnInterface
    client_username = each.value.clientUsername
    compressed_data_enabled = each.value.compressedDataEnabled
    connect_order = each.value.connectOrder
    egress_flow_window_size = each.value.egressFlowWindowSize
    enabled = each.value.enabled
    password = each.value.password
    queue_binding = each.value.queueBinding
    tls_enabled = each.value.tlsEnabled
    unidirectional_client_profile = each.value.unidirectionalClientProfile

  depends_on = [
    solacebroker_msg_vpn_bridge.bridges
  ]
}

resource "solacebroker_msg_vpn_bridge_remote_subscription" "remoteSubscriptions" {
  for_each = {
    for v in var.RemoteSubscriptions : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}.${v.remoteSubscriptionTopic}" => v
  }

    bridge_name = each.value.bridgeName
    bridge_virtual_router = each.value.bridgeVirtualRouter
    msg_vpn_name = each.value.msgVpnName
    remote_subscription_topic = each.value.remoteSubscriptionTopic
    deliver_always_enabled = each.value.deliverAlwaysEnabled

  depends_on = [
    solacebroker_msg_vpn_bridge.bridges
  ]
}

# Import
import {
  for_each = {
    for v in var.Bridges : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}" => "${urlencode(v.msgVpnName)}/${urlencode(v.bridgeName)}/${urlencode(v.bridgeVirtualRouter)}" if v._import==true
  }

  to = solacebroker_msg_vpn_bridge.bridges[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.RemoteMsgVpns : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}.${v.remoteMsgVpnName}.${v.remoteMsgVpnLocation}.${v.remoteMsgVpnInterface}" => "${urlencode(v.msgVpnName)}/${urlencode(v.bridgeName)}/${urlencode(v.bridgeVirtualRouter)}/${urlencode(v.remoteMsgVpnName)}/${urlencode(v.remoteMsgVpnLocation)}/${urlencode(v.remoteMsgVpnInterface)}" if v._import==true
  }

  to = solacebroker_msg_vpn_bridge_remote_msg_vpn.remoteMsgVpns[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.RemoteSubscriptions : "${v.msgVpnName}.${v.bridgeName}.${v.bridgeVirtualRouter}.${v.remoteSubscriptionTopic}" => "${urlencode(v.msgVpnName)}/${urlencode(v.bridgeName)}/${urlencode(v.bridgeVirtualRouter)}/${urlencode(v.remoteSubscriptionTopic)}" if v._import==true
  }

  to = solacebroker_msg_vpn_bridge_remote_subscription.remoteSubscriptions[each.key]
  id = each.value
}
