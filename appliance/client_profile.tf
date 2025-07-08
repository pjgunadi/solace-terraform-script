resource "solacebrokerappliance_msg_vpn_client_profile" "clientProfiles" {
    for_each = {
      for v in var.ClientProfiles : "${v.msgVpnName}.${v.clientProfileName}" => v
    }

    client_profile_name = each.value.clientProfileName
    msg_vpn_name = each.value.msgVpnName
    allow_bridge_connections_enabled = each.value.allowBridgeConnectionsEnabled
    allow_guaranteed_endpoint_create_durability = each.value.allowGuaranteedEndpointCreateDurability
    allow_guaranteed_endpoint_create_enabled = each.value.allowGuaranteedEndpointCreateEnabled
    allow_guaranteed_msg_receive_enabled = each.value.allowGuaranteedMsgReceiveEnabled
    allow_guaranteed_msg_send_enabled = each.value.allowGuaranteedMsgSendEnabled
    allow_shared_subscriptions_enabled = each.value.allowSharedSubscriptionsEnabled
    allow_transacted_sessions_enabled = each.value.allowTransactedSessionsEnabled
    api_queue_management_copy_from_on_create_template_name = each.value.apiQueueManagementCopyFromOnCreateTemplateName
    api_topic_endpoint_management_copy_from_on_create_template_name = each.value.apiTopicEndpointManagementCopyFromOnCreateTemplateName
    compression_enabled = each.value.compressionEnabled
    eliding_delay = each.value.elidingDelay
    eliding_enabled = each.value.elidingEnabled
    max_amqp_link_count = each.value.maxAmqpLinkCount
    max_connection_count_per_client_username = each.value.maxConnectionCountPerClientUsername
    max_egress_flow_count = each.value.maxEgressFlowCount
    max_endpoint_count_per_client_username = each.value.maxEndpointCountPerClientUsername
    max_ingress_flow_count = each.value.maxIngressFlowCount
    max_msgs_per_transaction = each.value.maxMsgsPerTransaction
    max_subscription_count = each.value.maxSubscriptionCount
    max_transacted_session_count = each.value.maxTransactedSessionCount
    max_transaction_count = each.value.maxTransactionCount
    queue_control1_max_depth = each.value.queueControl1MaxDepth
    queue_control1_min_msg_burst = each.value.queueControl1MinMsgBurst
    queue_direct1_max_depth = each.value.queueDirect1MaxDepth
    queue_direct1_min_msg_burst = each.value.queueDirect1MinMsgBurst
    queue_direct2_max_depth = each.value.queueDirect2MaxDepth
    queue_direct2_min_msg_burst = each.value.queueDirect2MinMsgBurst
    queue_direct3_max_depth = each.value.queueDirect3MaxDepth
    queue_direct3_min_msg_burst = each.value.queueDirect3MinMsgBurst
    queue_guaranteed1_max_depth = each.value.queueGuaranteed1MaxDepth
    queue_guaranteed1_min_msg_burst = each.value.queueGuaranteed1MinMsgBurst
    reject_msg_to_sender_on_no_subscription_match_enabled = each.value.rejectMsgToSenderOnNoSubscriptionMatchEnabled
    replication_allow_client_connect_when_standby_enabled = each.value.replicationAllowClientConnectWhenStandbyEnabled
    service_min_keepalive_timeout = each.value.serviceMinKeepaliveTimeout
    service_smf_max_connection_count_per_client_username = each.value.serviceSmfMaxConnectionCountPerClientUsername
    service_smf_min_keepalive_enabled = each.value.serviceSmfMinKeepaliveEnabled
    service_web_inactive_timeout = each.value.serviceWebInactiveTimeout
    service_web_max_connection_count_per_client_username = each.value.serviceWebMaxConnectionCountPerClientUsername
    service_web_max_payload = each.value.serviceWebMaxPayload
    tcp_congestion_window_size = each.value.tcpCongestionWindowSize
    tcp_keepalive_count = each.value.tcpKeepaliveCount
    tcp_keepalive_idle_time = each.value.tcpKeepaliveIdleTime
    tcp_keepalive_interval = each.value.tcpKeepaliveInterval
    tcp_max_segment_size = each.value.tcpMaxSegmentSize
    tcp_max_window_size = each.value.tcpMaxWindowSize
    tls_allow_downgrade_to_plain_text_enabled = each.value.tlsAllowDowngradeToPlainTextEnabled
    #Thresholds
    event_client_provisioned_endpoint_spool_usage_threshold = each.value.eventClientProvisionedEndpointSpoolUsageThreshold
    event_connection_count_per_client_username_threshold = each.value.eventConnectionCountPerClientUsernameThreshold
    event_egress_flow_count_threshold = each.value.eventEgressFlowCountThreshold
    event_endpoint_count_per_client_username_threshold = each.value.eventEndpointCountPerClientUsernameThreshold
    event_ingress_flow_count_threshold = each.value.eventIngressFlowCountThreshold
    event_service_smf_connection_count_per_client_username_threshold = each.value.eventServiceSmfConnectionCountPerClientUsernameThreshold
    event_service_web_connection_count_per_client_username_threshold = each.value.eventServiceWebConnectionCountPerClientUsernameThreshold
    event_subscription_count_threshold = each.value.eventSubscriptionCountThreshold
    event_transacted_session_count_threshold = each.value.eventTransactedSessionCountThreshold
    event_transaction_count_threshold = each.value.eventTransactionCountThreshold

    depends_on = [
      solacebrokerappliance_msg_vpn.msgVpns
    ]
}

# Import
import {
  for_each = {
    for v in var.ClientProfiles : "${v.msgVpnName}.${v.clientProfileName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.clientProfileName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_client_profile.clientProfiles[each.key]
  id = each.value
}