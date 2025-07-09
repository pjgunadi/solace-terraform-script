resource "solacebroker_msg_vpn_client_username" "clientUsernames" {
  for_each = {
    for v in var.ClientUsernames : "${v.msgVpnName}.${v.clientUsername}" => v
  }

  client_username = each.value.clientUsername
  msg_vpn_name = each.value.msgVpnName
  acl_profile_name = each.value.aclProfileName
  client_profile_name = each.value.clientProfileName
  enabled = each.value.enabled
  guaranteed_endpoint_permission_override_enabled = each.value.guaranteedEndpointPermissionOverrideEnabled
  password = each.value.password
  subscription_manager_enabled = each.value.subscriptionManagerEnabled
  
  depends_on = [
    solacebroker_msg_vpn.msgVpns,
    solacebroker_msg_vpn_acl_profile.aclProfiles,
    solacebroker_msg_vpn_client_profile.clientProfiles,
    solacebroker_msg_vpn_telemetry_profile.telemetryProfiles
  ]
}

resource "solacebroker_msg_vpn_client_username_attribute" "clientUsernameAttributes" {
  for_each = {
    for v in var.ClientUsernameAttributes : "${v.msgVpnName}.${v.clientUsername}.${v.attributeName}.${v.attributeValue}" => v
  }

  client_username = each.value.clientUsername
  msg_vpn_name = each.value.msgVpnName
  attribute_name = each.value.attributeName
  attribute_value = each.value.attributeValue
  
  depends_on = [
    solacebroker_msg_vpn_client_username.clientUsernames
  ]
}

# Import
import {
  for_each = {
    for v in var.ClientUsernames : "${v.msgVpnName}.${v.clientUsername}" => "${urlencode(v.msgVpnName)}/${urlencode(v.clientUsername)}" if v._import==true
  }

  to = solacebroker_msg_vpn_client_username.clientUsernames[each.key]
  id = each.value
}

import {
  for_each = {
    for v in var.ClientUsernameAttributes : "${v.msgVpnName}.${v.clientUsername}.${v.attributeName}.${v.attributeValue}" => "${urlencode(v.msgVpnName)}/${urlencode(v.clientUsername)}/${urlencode(v.attributeName)}/${urlencode(v.attributeValue)}" if v._import==true
  }

  to = solacebroker_msg_vpn_client_username_attribute.clientUsernameAttributes[each.key]
  id = each.value
}
