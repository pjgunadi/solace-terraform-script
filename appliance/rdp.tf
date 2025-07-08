
resource "solacebrokerappliance_msg_vpn_rest_delivery_point" "restDeliveryPoints" {
  for_each = {
    for v in var.RestDeliveryPoints : "${v.msgVpnName}.${v.restDeliveryPointName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  rest_delivery_point_name = each.value.restDeliveryPointName
  client_profile_name = each.value.clientProfileName
  enabled = each.value.enabled
  service = each.value.service
  vendor = each.value.vendor

  depends_on = [
    solacebrokerappliance_msg_vpn.msgVpns
  ]
}

resource "solacebrokerappliance_msg_vpn_rest_delivery_point_queue_binding" "rdpQueueBindings" {
  for_each = {
    for v in var.RdpQueueBindings : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.queueBindingName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  rest_delivery_point_name = each.value.restDeliveryPointName
  queue_binding_name = each.value.queueBindingName
  gateway_replace_target_authority_enabled = each.value.gatewayReplaceTargetAuthorityEnabled
  post_request_target = each.value.postRequestTarget
  request_target_evaluation = each.value.requestTargetEvaluation

  depends_on = [
    solacebrokerappliance_msg_vpn_rest_delivery_point.restDeliveryPoints
  ]
}

resource "solacebrokerappliance_msg_vpn_rest_delivery_point_queue_binding_protected_request_header" "rdpQueueBindingProtectedRequestHeaders" {
  for_each = {
    for v in var.RdpQueueBindingProtectedRequestHeaders : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.queueBindingName}.${v.headerName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  rest_delivery_point_name = each.value.restDeliveryPointName
  queue_binding_name = each.value.queueBindingName
  header_name = each.value.headerName
  header_value = each.value.headerValue
  
  depends_on = [
    solacebrokerappliance_msg_vpn_rest_delivery_point_queue_binding.rdpQueueBindings
  ]
}

resource "solacebrokerappliance_msg_vpn_rest_delivery_point_queue_binding_request_header" "rdpQueueBindingRequestHeaders" {
  for_each = {
    for v in var.RdpQueueBindingRequestHeaders : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.queueBindingName}.${v.headerName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  rest_delivery_point_name = each.value.restDeliveryPointName
  queue_binding_name = each.value.queueBindingName
  header_name = each.value.headerName
  header_value = each.value.headerValue

  depends_on = [
    solacebrokerappliance_msg_vpn_rest_delivery_point_queue_binding.rdpQueueBindings
  ]
}

resource "solacebrokerappliance_msg_vpn_rest_delivery_point_rest_consumer" "rdpRestConsumers" {
    for_each = {
        for v in var.RdpRestConsumers : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.restConsumerName}" => v
    }
    msg_vpn_name = each.value.msgVpnName
    rest_consumer_name = each.value.restConsumerName
    rest_delivery_point_name = each.value.restDeliveryPointName
    authentication_aws_access_key_id = each.value.authenticationAwsAccessKeyId
    authentication_aws_region = each.value.authenticationAwsRegion
    authentication_aws_secret_access_key = each.value.authenticationAwsSecretAccessKey
    authentication_aws_service = each.value.authenticationAwsService
    authentication_client_cert_content = each.value.authenticationClientCertContent
    authentication_client_cert_password = each.value.authenticationClientCertPassword
    authentication_http_basic_password = each.value.authenticationHttpBasicPassword
    authentication_http_basic_username = each.value.authenticationHttpBasicUsername
    authentication_http_header_name = each.value.authenticationHttpHeaderName
    authentication_http_header_value = each.value.authenticationHttpHeaderValue
    authentication_oauth_client_id = each.value.authenticationOauthClientId
    authentication_oauth_client_scope = each.value.authenticationOauthClientScope
    authentication_oauth_client_secret = each.value.authenticationOauthClientSecret
    authentication_oauth_client_token_endpoint = each.value.authenticationOauthClientTokenEndpoint
    authentication_oauth_client_token_expiry_default = each.value.authenticationOauthClientTokenExpiryDefault
    authentication_oauth_jwt_secret_key = each.value.authenticationOauthJwtSecretKey
    authentication_oauth_jwt_token_endpoint = each.value.authenticationOauthJwtTokenEndpoint
    authentication_oauth_jwt_token_expiry_default = each.value.authenticationOauthJwtTokenExpiryDefault
    authentication_scheme = each.value.authenticationScheme
    enabled = each.value.enabled
    http_method = each.value.httpMethod
    local_interface = each.value.localInterface
    max_post_wait_time = each.value.maxPostWaitTime
    outgoing_connection_count = each.value.outgoingConnectionCount
    proxy_name = each.value.proxyName
    remote_host = each.value.remoteHost
    remote_port = each.value.remotePort
    retry_delay = each.value.retryDelay
    tls_cipher_suite_list = each.value.tlsCipherSuiteList
    tls_enabled = each.value.tlsEnabled

    depends_on = [
        solacebrokerappliance_msg_vpn_rest_delivery_point.restDeliveryPoints
    ]
}

resource "solacebrokerappliance_msg_vpn_rest_delivery_point_rest_consumer_oauth_jwt_claim" "rdpRestConsumerOauthJwtClaims" {
  for_each = {
    for v in var.RdpRestConsumerOauthJwtClaims : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.restConsumerName}.${v.oauthJwtClaimName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  rest_delivery_point_name = each.value.restDeliveryPointName
  rest_consumer_name = each.value.restConsumerName
  oauth_jwt_claim_name = each.value.oauthJwtClaimName
  oauth_jwt_claim_value = each.value.oauthJwtClaimValue
  
  depends_on = [
    solacebrokerappliance_msg_vpn_rest_delivery_point_rest_consumer.rdpRestConsumers
  ]
}

# Import
import {
  for_each = {
    for v in var.RestDeliveryPoints : "${v.msgVpnName}.${v.restDeliveryPointName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.restDeliveryPointName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_rest_delivery_point.restDeliveryPoints[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.RdpQueueBindings : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.queueBindingName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.restDeliveryPointName)}/${urlencode(v.queueBindingName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_rest_delivery_point_queue_binding.rdpQueueBindings[each.key]
  id = each.value
}
  
import {
  for_each = {
    for v in var.RdpQueueBindingProtectedRequestHeaders : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.queueBindingName}.${v.headerName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.restDeliveryPointName)}/${urlencode(v.queueBindingName)}/${urlencode(v.headerName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_rest_delivery_point_queue_binding_protected_request_header.rdpQueueBindingProtectedRequestHeaders[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.RdpQueueBindingRequestHeaders : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.queueBindingName}.${v.headerName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.restDeliveryPointName)}/${urlencode(v.queueBindingName)}/${urlencode(v.headerName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_rest_delivery_point_queue_binding_request_header.rdpQueueBindingRequestHeaders[each.key]
  id = each.value
}

import {
  for_each = {
        for v in var.RdpRestConsumers : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.restConsumerName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.restDeliveryPointName)}/${urlencode(v.restConsumerName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_rest_delivery_point_rest_consumer.rdpRestConsumers[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.RdpRestConsumerOauthJwtClaims : "${v.msgVpnName}.${v.restDeliveryPointName}.${v.restConsumerName}.${v.oauthJwtClaimName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.restDeliveryPointName)}/${urlencode(v.restConsumerName)}/${urlencode(v.oauthJwtClaimName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_rest_delivery_point_rest_consumer_oauth_jwt_claim.rdpRestConsumerOauthJwtClaims[each.key]
  id = each.value
}
