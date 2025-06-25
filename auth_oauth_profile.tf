resource "solacebroker_msg_vpn_authentication_oauth_profile" "authenticationOauthProfiles" {
    for_each = {
        for v in var.AuthenticationOauthProfiles : "${v.msgVpnName}.${v.oauthProfileName}" => v
    }
    msg_vpn_name = each.value.msgVpnName
    oauth_profile_name = each.value.oauthProfileName
    authorization_groups_claim_name = each.value.authorizationGroupsClaimName
    authorization_groups_claim_string_format = each.value.authorizationGroupsClaimStringFormat
    client_id = each.value.clientId
    client_required_type = each.value.clientRequiredType
    client_secret = each.value.clientSecret
    client_validate_type_enabled = each.value.clientValidateTypeEnabled
    disconnect_on_token_expiration_enabled = each.value.disconnectOnTokenExpirationEnabled
    enabled = each.value.enabled
    endpoint_discovery = each.value.endpointDiscovery
    endpoint_discovery_refresh_interval = each.value.endpointDiscoveryRefreshInterval
    endpoint_introspection = each.value.endpointIntrospection
    endpoint_introspection_timeout = each.value.endpointIntrospectionTimeout
    endpoint_jwks = each.value.endpointJwks
    endpoint_jwks_refresh_interval = each.value.endpointJwksRefreshInterval
    endpoint_userinfo = each.value.endpointUserinfo
    endpoint_userinfo_timeout = each.value.endpointUserinfoTimeout
    issuer = each.value.issuer
    mqtt_username_validate_enabled = each.value.mqttUsernameValidateEnabled
    oauth_role = each.value.oauthRole
    proxy_name = each.value.proxyName
    resource_server_parse_access_token_enabled = each.value.resourceServerParseAccessTokenEnabled
    resource_server_required_audience = each.value.resourceServerRequiredAudience
    resource_server_required_issuer = each.value.resourceServerRequiredIssuer
    resource_server_required_scope = each.value.resourceServerRequiredScope
    resource_server_required_type = each.value.resourceServerRequiredType
    resource_server_validate_audience_enabled = each.value.resourceServerValidateAudienceEnabled
    resource_server_validate_issuer_enabled = each.value.resourceServerValidateIssuerEnabled
    resource_server_validate_scope_enabled = each.value.resourceServerValidateScopeEnabled
    resource_server_validate_type_enabled = each.value.resourceServerValidateTypeEnabled
    username_claim_name = each.value.usernameClaimName

  depends_on = [
    solacebroker_msg_vpn.msgVpns
  ]
}

resource "solacebroker_msg_vpn_authentication_oauth_profile_client_required_claim" "authenticationOauthProfileClientRequiredClaims" {
    for_each = {
        for v in var.AuthOauthProfileClientRequiredClaims : "${v.msgVpnName}.${v.oauthProfileName}.${v.clientRequiredClaimName}" => v
    }
    msg_vpn_name = each.value.msgVpnName
    oauth_profile_name = each.value.oauthProfileName
    client_required_claim_name = each.value.clientRequiredClaimName
    client_required_claim_value = each.value.clientRequiredClaimValue

    depends_on = [
        solacebroker_msg_vpn_authentication_oauth_profile.authenticationOauthProfiles
    ]
}

resource "solacebroker_msg_vpn_authentication_oauth_profile_resource_server_required_claim" "authenticationOauthProfileResourceServerRequiredClaims" {
    for_each = {
        for v in var.AuthOauthProfileResourceServerRequiredClaims : "${v.msgVpnName}.${v.oauthProfileName}.${v.resourceServerRequiredClaimName}" => v
    }
    msg_vpn_name = each.value.msgVpnName
    oauth_profile_name = each.value.oauthProfileName
    resource_server_required_claim_name = each.value.resourceServerRequiredClaimName
    resource_server_required_claim_value = each.value.resourceServerRequiredClaimValue
    
    depends_on = [
        solacebroker_msg_vpn_authentication_oauth_profile.authenticationOauthProfiles
    ]
}