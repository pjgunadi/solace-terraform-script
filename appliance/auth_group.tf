resource "solacebrokerappliance_msg_vpn_authorization_group" "authorizationGroups" {
  for_each = {
    for v in var.AuthorizationGroups : "${v.msgVpnName}.${v.authorizationGroupName}" => v
  }
  
  authorization_group_name = each.value.authorizationGroupName
  msg_vpn_name = each.value.msgVpnName
  acl_profile_name = each.value.aclProfileName
  client_profile_name = each.value.clientProfileName
  enabled = each.value.enabled
  order_after_authorization_group_name = each.value.orderAfterAuthorizationGroupName
  order_before_authorization_group_name = each.value.orderBeforeAuthorizationGroupName

  depends_on = [
    solacebrokerappliance_msg_vpn.msgVpns,
    solacebrokerappliance_msg_vpn_acl_profile.aclProfiles,
    solacebrokerappliance_msg_vpn_client_profile.clientProfiles
  ]
}

# Import
import {
  for_each = {
    for v in var.AuthorizationGroups : "${v.msgVpnName}.${v.authorizationGroupName}" => "${urlencode(v.msgVpnName)}/${urlencode(v.authorizationGroupName)}" if v._import==true
  }

  to = solacebrokerappliance_msg_vpn_authorization_group.authorizationGroups[each.key]
  id = each.value
}