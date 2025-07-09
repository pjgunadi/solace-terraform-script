resource "solacebroker_msg_vpn_jndi_connection_factory" "jndiConnectionFactories" {
  for_each = {
    for v in var.JndiConnectionFactories : "${v.msgVpnName}.${v.connectionFactoryName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  connection_factory_name = each.value.connectionFactoryName
  allow_duplicate_client_id_enabled = each.value.allowDuplicateClientIdEnabled
  client_description = each.value.clientDescription
  client_id = each.value.clientId
  dto_receive_override_enabled = each.value.dtoReceiveOverrideEnabled
  dto_receive_subscriber_local_priority = each.value.dtoReceiveSubscriberLocalPriority
  dto_receive_subscriber_network_priority = each.value.dtoReceiveSubscriberNetworkPriority
  dto_send_enabled = each.value.dtoSendEnabled
  dynamic_endpoint_create_durable_enabled = each.value.dynamicEndpointCreateDurableEnabled
  dynamic_endpoint_respect_ttl_enabled = each.value.dynamicEndpointRespectTtlEnabled
  guaranteed_receive_ack_timeout = each.value.guaranteedReceiveAckTimeout
  guaranteed_receive_reconnect_retry_count = each.value.guaranteedReceiveReconnectRetryCount
  guaranteed_receive_reconnect_retry_wait = each.value.guaranteedReceiveReconnectRetryWait
  guaranteed_receive_window_size = each.value.guaranteedReceiveWindowSize
  guaranteed_receive_window_size_ack_threshold = each.value.guaranteedReceiveWindowSizeAckThreshold
  guaranteed_send_ack_timeout = each.value.guaranteedSendAckTimeout
  guaranteed_send_window_size = each.value.guaranteedSendWindowSize
  messaging_default_delivery_mode = each.value.messagingDefaultDeliveryMode
  messaging_default_dmq_eligible_enabled = each.value.messagingDefaultDmqEligibleEnabled
  messaging_default_eliding_eligible_enabled = each.value.messagingDefaultElidingEligibleEnabled
  messaging_jmsx_user_id_enabled = each.value.messagingJmsxUserIdEnabled
  messaging_text_in_xml_payload_enabled = each.value.messagingTextInXmlPayloadEnabled
  transport_compression_level = each.value.transportCompressionLevel
  transport_connect_retry_count = each.value.transportConnectRetryCount
  transport_connect_retry_per_host_count = each.value.transportConnectRetryPerHostCount
  transport_connect_timeout = each.value.transportConnectTimeout
  transport_direct_transport_enabled = each.value.transportDirectTransportEnabled
  transport_keepalive_count = each.value.transportKeepaliveCount
  transport_keepalive_enabled = each.value.transportKeepaliveEnabled
  transport_keepalive_interval = each.value.transportKeepaliveInterval
  transport_msg_callback_on_io_thread_enabled = each.value.transportMsgCallbackOnIoThreadEnabled
  transport_optimize_direct_enabled = each.value.transportOptimizeDirectEnabled
  transport_port = each.value.transportPort
  transport_read_timeout = each.value.transportReadTimeout
  transport_receive_buffer_size = each.value.transportReceiveBufferSize
  transport_reconnect_retry_count = each.value.transportReconnectRetryCount
  transport_reconnect_retry_wait = each.value.transportReconnectRetryWait
  transport_send_buffer_size = each.value.transportSendBufferSize
  transport_tcp_no_delay_enabled = each.value.transportTcpNoDelayEnabled
  xa_enabled = each.value.xaEnabled

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}

resource "solacebroker_msg_vpn_jndi_queue" "jndiQueues" {
  for_each = {
    for v in var.JndiQueues : "${v.msgVpnName}.${v.queueName}" => v
  }

  msg_vpn_name = each.value.msgVpnName
  queue_name = each.value.queueName
  physical_name = each.value.physicalName

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}

resource "solacebroker_msg_vpn_jndi_topic" "jndiTopics" {
  for_each = {
    for v in var.JndiTopics : "${v.msgVpnName}.${v.topicName}" => v
  }

  msg_vpn_name = each.value.msgVpnName
  topic_name = each.value.topicName
  physical_name = each.value.physicalName

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}

# Import
import {
  for_each = {
    for v in var.JndiConnectionFactories : "${v.msgVpnName}.${v.connectionFactoryName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.connectionFactoryName)}" if v._import==true
  }

  to = solacebroker_msg_vpn_jndi_connection_factory.jndiConnectionFactories[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.JndiQueues : "${v.msgVpnName}.${v.queueName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.queueName)}" if v._import==true
  }

  to = solacebroker_msg_vpn_jndi_queue.jndiQueues[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.JndiTopics : "${v.msgVpnName}.${v.topicName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.topicName)}" if v._import==true
  }

  to = solacebroker_msg_vpn_jndi_topic.jndiTopics[each.key]
  id = each.value
}
  