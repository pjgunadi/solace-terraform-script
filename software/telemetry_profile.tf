resource "solacebroker_msg_vpn_telemetry_profile" "telemetryProfiles" {
    for_each = {
        for v in var.TelemetryProfiles : "${v.msgVpnName}.${v.telemetryProfileName}" => v
    }
  
    msg_vpn_name = each.value.msgVpnName
    telemetry_profile_name = each.value.telemetryProfileName
    queue_event_bind_count_threshold = each.value.queueEventBindCountThreshold
    queue_event_msg_spool_usage_threshold = each.value.queueEventMsgSpoolUsageThreshold
    queue_max_bind_count = each.value.queueMaxBindCount
    queue_max_msg_spool_usage = each.value.queueMaxMsgSpoolUsage
    receiver_acl_connect_default_action = each.value.receiverAclConnectDefaultAction
    receiver_enabled = each.value.receiverEnabled
    receiver_event_connection_count_per_client_username_threshold = each.value.receiverEventConnectionCountPerClientUsernameThreshold
    receiver_max_connection_count_per_client_username = each.value.receiverMaxConnectionCountPerClientUsername
    receiver_tcp_congestion_window_size = each.value.receiverTcpCongestionWindowSize
    receiver_tcp_keepalive_count = each.value.receiverTcpKeepaliveCount
    receiver_tcp_keepalive_idle_time = each.value.receiverTcpKeepaliveIdleTime
    receiver_tcp_keepalive_interval = each.value.receiverTcpKeepaliveInterval
    receiver_tcp_max_segment_size = each.value.receiverTcpMaxSegmentSize
    receiver_tcp_max_window_size = each.value.receiverTcpMaxWindowSize
    trace_enabled = each.value.traceEnabled
    trace_send_span_generation_enabled = each.value.traceSendSpanGenerationEnabled

    depends_on = [
        solacebroker_msg_vpn.msgVpns
    ]
}

resource "solacebroker_msg_vpn_telemetry_profile_receiver_acl_connect_exception" "telemetryProfileReceiverAclConnectExceptions" {
    for_each = {
        for v in var.TelemetryProfileReceiverAclConnectExceptions : "${v.msgVpnName}.${v.telemetryProfileName}.${v.receiverAclConnectExceptionAddress}" => v
    }
  
  msg_vpn_name = each.value.msgVpnName
  telemetry_profile_name = each.value.telemetryProfileName
  receiver_acl_connect_exception_address = each.value.receiverAclConnectExceptionAddress

  depends_on = [
    solacebroker_msg_vpn_telemetry_profile.telemetryProfiles
  ]
}

resource "solacebroker_msg_vpn_telemetry_profile_trace_filter" "telemetryProfileTraceFilters" {
    for_each = {
        for v in var.TelemetryProfileTraceFilters : "${v.msgVpnName}.${v.telemetryProfileName}.${v.traceFilterName}" => v
    }
  
  msg_vpn_name = each.value.msgVpnName
  telemetry_profile_name = each.value.telemetryProfileName
  trace_filter_name = each.value.traceFilterName
  enabled = each.value.enabled

  depends_on = [
    solacebroker_msg_vpn_telemetry_profile.telemetryProfiles
  ]
}

resource "solacebroker_msg_vpn_telemetry_profile_trace_filter_subscription" "telemetryProfileTraceFilterSubscriptions" {
    for_each = {
        for v in var.TelemetryProfileTraceFilterSubscriptions : "${v.msgVpnName}.${v.telemetryProfileName}.${v.traceFilterName}.${v.subscription}.${v.subscriptionSyntax}" => v
    }
  
    msg_vpn_name = each.value.msgVpnName
    telemetry_profile_name = each.value.telemetryProfileName
    trace_filter_name = each.value.traceFilterName
    subscription = each.value.subscription
    subscription_syntax = each.value.subscriptionSyntax

    depends_on = [
        solacebroker_msg_vpn_telemetry_profile_trace_filter.telemetryProfileTraceFilters
    ]
}

# Import
import {
    for_each = {
        for v in var.TelemetryProfiles : "${v.msgVpnName}.${v.telemetryProfileName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.telemetryProfileName)}" if v._import==true
    }

    to = solacebroker_msg_vpn_telemetry_profile.telemetryProfiles[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.TelemetryProfileReceiverAclConnectExceptions : "${v.msgVpnName}.${v.telemetryProfileName}.${v.receiverAclConnectExceptionAddress}" => "${urlencode(v.msgVpnName)}/${urlencode(v.telemetryProfileName)}/${urlencode(v.receiverAclConnectExceptionAddress)}" if v._import==true
    }

    to = solacebroker_msg_vpn_telemetry_profile_receiver_acl_connect_exception.telemetryProfileReceiverAclConnectExceptions[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.TelemetryProfileTraceFilters : "${v.msgVpnName}.${v.telemetryProfileName}.${v.traceFilterName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.telemetryProfileName)}/${urlencode(v.traceFilterName)}" if v._import==true
    }

    to = solacebroker_msg_vpn_telemetry_profile_trace_filter.telemetryProfileTraceFilters[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.TelemetryProfileTraceFilterSubscriptions : "${v.msgVpnName}.${v.telemetryProfileName}.${v.traceFilterName}.${v.subscription}.${v.subscriptionSyntax}" => "${urlencode(v.msgVpnName)}/${urlencode(v.telemetryProfileName)}/${urlencode(v.traceFilterName)}/${urlencode(v.subscription)}/${urlencode(v.subscriptionSyntax)}" if v._import==true
    }

    to = solacebroker_msg_vpn_telemetry_profile_trace_filter_subscription.telemetryProfileTraceFilterSubscriptions[each.key]
    id = each.value
}
