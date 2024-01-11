resource "solacebroker_msg_vpn_acl_profile" "aclProfiles" {
  for_each = {
    for v in var.AclProfiles : "${v.msgVpnName}.${v.aclProfileName}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  acl_profile_name = each.value.aclProfileName
  client_connect_default_action = each.value.clientConnectDefaultAction
  publish_topic_default_action = each.value.publishTopicDefaultAction
  subscribe_topic_default_action = each.value.subscribeTopicDefaultAction
  subscribe_share_name_default_action = each.value.subscribeShareNameDefaultAction

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}

resource "solacebroker_msg_vpn_acl_profile_client_connect_exception" "clientConnectExceptions" {
  for_each = {
    for v in var.ClientConnectExceptions : "${v.msgVpnName}.${v.aclProfileName}.${v.clientConnectExceptionAddress}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  acl_profile_name = each.value.aclProfileName
  client_connect_exception_address = each.value.clientConnectExceptionAddress

  depends_on = [
    solacebroker_msg_vpn_acl_profile.aclProfiles
  ]
}

resource "solacebroker_msg_vpn_acl_profile_publish_topic_exception" "publishTopicExceptions" {
  for_each = {
    for v in var.PublishTopicExceptions : "${v.msgVpnName}.${v.aclProfileName}.${v.publishTopicException}.${v.publishTopicExceptionSyntax}" => v
  }

  msg_vpn_name = each.value.msgVpnName
  acl_profile_name = each.value.aclProfileName
  publish_topic_exception = each.value.publishTopicException
  publish_topic_exception_syntax = each.value.publishTopicExceptionSyntax

  depends_on = [
    solacebroker_msg_vpn_acl_profile.aclProfiles
  ]
}

resource "solacebroker_msg_vpn_acl_profile_subscribe_topic_exception" "subscribeTopicExceptions" {
  for_each = {
    for v in var.SubscribeTopicExceptions : "${v.msgVpnName}.${v.aclProfileName}.${v.subscribeTopicException}.${v.subscribeTopicExceptionSyntax}" => v
  }

  msg_vpn_name = each.value.msgVpnName
  acl_profile_name = each.value.aclProfileName
  subscribe_topic_exception = each.value.subscribeTopicException
  subscribe_topic_exception_syntax = each.value.subscribeTopicExceptionSyntax

  depends_on = [
    solacebroker_msg_vpn_acl_profile.aclProfiles
  ]
}

resource "solacebroker_msg_vpn_acl_profile_subscribe_share_name_exception" "subscribeShareNameExceptions" {
  for_each =  {
    for v in var.SubscribeShareNameExceptions : "${v.msgVpnName}.${v.aclProfileName}.${v.subscribeShareNameException}.${v.subscribeShareNameExceptionSyntax}" => v
  }
  msg_vpn_name = each.value.msgVpnName
  acl_profile_name = each.value.aclProfileName
  subscribe_share_name_exception = each.value.subscribeShareNameException
  subscribe_share_name_exception_syntax = each.value.subscribeShareNameExceptionSyntax

  depends_on = [
    solacebroker_msg_vpn_acl_profile.aclProfiles
  ]
}