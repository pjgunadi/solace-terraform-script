resource "solacebroker_oauth_profile" "oauthProfiles" {
    for_each = {
        for v in var.OauthProfiles : "${v.oauthProfileName}" => v
    }
    
    oauth_profile_name = each.value.oauthProfileName
    access_level_groups_claim_name = each.value.accessLevelGroupsClaimName
    access_level_groups_claim_string_format = each.value.accessLevelGroupsClaimStringFormat
    client_id = each.value.clientId
    client_redirect_uri = each.value.clientRedirectUri
    client_required_type = each.value.clientRequiredType
    client_scope = each.value.clientScope
    client_secret = each.value.clientSecret
    client_validate_type_enabled = each.value.clientValidateTypeEnabled
    default_global_access_level = each.value.defaultGlobalAccessLevel
    default_msg_vpn_access_level = each.value.defaultMsgVpnAccessLevel
    display_name = each.value.displayName
    enabled = each.value.enabled
    endpoint_authorization = each.value.endpointAuthorization
    endpoint_discovery = each.value.endpointDiscovery
    endpoint_discovery_refresh_interval = each.value.endpointDiscoveryRefreshInterval
    endpoint_introspection = each.value.endpointIntrospection
    endpoint_introspection_timeout = each.value.endpointIntrospectionTimeout
    endpoint_jwks = each.value.endpointJwks
    endpoint_jwks_refresh_interval = each.value.endpointJwksRefreshInterval
    endpoint_token = each.value.endpointToken
    endpoint_token_timeout = each.value.endpointTokenTimeout
    endpoint_userinfo = each.value.endpointUserinfo
    endpoint_userinfo_timeout = each.value.endpointUserinfoTimeout
    interactive_enabled = each.value.interactiveEnabled
    interactive_prompt_for_expired_session = each.value.interactivePromptForExpiredSession
    interactive_prompt_for_new_session = each.value.interactivePromptForNewSession
    issuer = each.value.issuer
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
    semp_enabled = each.value.sempEnabled
    username_claim_name = each.value.usernameClaimName

}

resource "solacebroker_oauth_profile_access_level_group" "oauthProfileAccessLevelGroups" {
    for_each = {
        for v in var.OauthProfileAccessLevelGroups : "${v.oauthProfileName}.${v.groupName}" => v
    }
    
    oauth_profile_name = each.value.oauthProfileName
    group_name = each.value.groupName
    description = each.value.description
    global_access_level = each.value.globalAccessLevel
    msg_vpn_access_level = each.value.msgVpnAccessLevel

    depends_on = [
        solacebroker_oauth_profile.oauthProfiles
    ]
}

resource "solacebroker_oauth_profile_access_level_group_msg_vpn_access_level_exception" "oauthProfileAccessLevelGroupVpnAccessLevelExceptions" {
    for_each = {
        for v in var.OauthProfileAccessLevelGroupVpnAccessLevelExceptions : "${v.oauthProfileName}.${v.groupName}.${v.msgVpnName}" => v
    }
    
    oauth_profile_name = each.value.oauthProfileName
    group_name = each.value.groupName
    msg_vpn_name = each.value.msgVpnName
    access_level = each.value.accessLevel

    depends_on = [
        solacebroker_oauth_profile_access_level_group.oauthProfileAccessLevelGroups
    ]
}

resource "solacebroker_oauth_profile_default_msg_vpn_access_level_exception" "oauthProfileDefaultVpnAccessLevelExceptions" {
    for_each = {
        for v in var.OauthProfileDefaultVpnAccessLevelExceptions : "${v.oauthProfileName}.${v.msgVpnName}" => v
    }
    
    oauth_profile_name = each.value.oauthProfileName
    msg_vpn_name = each.value.msgVpnName
    access_level = each.value.accessLevel

    depends_on = [
        solacebroker_oauth_profile.oauthProfiles
    ]
}

resource "solacebroker_oauth_profile_client_allowed_host" "oauthProfileClientAllowedHosts" {
    for_each = {
        for v in var.OauthProfileClientAllowedHosts : "${v.oauthProfileName}.${v.allowedHost}" => v
    }
    
    oauth_profile_name = each.value.oauthProfileName
    allowed_host = each.value.allowedHost
    
    depends_on = [
        solacebroker_oauth_profile.oauthProfiles
    ]
}

resource "solacebroker_oauth_profile_client_authorization_parameter" "oauthProfileClientAuthorizationParameters" {
    for_each = {
        for v in var.OauthProfileClientAuthorizationParameters : "${v.oauthProfileName}.${v.authorizationParameterName}" => v
    }
    
    oauth_profile_name = each.value.oauthProfileName
    authorization_parameter_name = each.value.authorizationParameterName
    authorization_parameter_value = each.value.authorizationParameterValue
    
    depends_on = [
        solacebroker_oauth_profile.oauthProfiles
    ]
}

resource "solacebroker_oauth_profile_client_required_claim" "oauthProfileClientRequiredClaims" {
    for_each = {
        for v in var.OauthProfileClientRequiredClaims : "${v.oauthProfileName}.${v.clientRequiredClaimName}" => v
    }
    
    oauth_profile_name = each.value.oauthProfileName
    client_required_claim_name = each.value.clientRequiredClaimName
    client_required_claim_value = each.value.clientRequiredClaimValue
    
    depends_on = [
        solacebroker_oauth_profile.oauthProfiles
    ]
}

resource "solacebroker_oauth_profile_resource_server_required_claim" "oauthProfileResourceServerRequiredClaims" {
    for_each = {
        for v in var.OauthProfileResourceServerRequiredClaims : "${v.oauthProfileName}.${v.resourceServerRequiredClaimName}" => v
    }
    
    oauth_profile_name = each.value.oauthProfileName
    resource_server_required_claim_name = each.value.resourceServerRequiredClaimName
    resource_server_required_claim_value = each.value.resourceServerRequiredClaimValue
    
    depends_on = [
        solacebroker_oauth_profile.oauthProfiles
    ]
}

# Import
import {
    for_each = {
        for v in var.OauthProfiles : "${v.oauthProfileName}" => "${urlencode(v.oauthProfileName)}" if v._import==true
    }

    to = solacebroker_oauth_profile.oauthProfiles[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.OauthProfileAccessLevelGroups : "${v.oauthProfileName}.${v.groupName}" => "${urlencode(v.oauthProfileName)}/${urlencode(v.groupName)}" if v._import==true
    }

    to = solacebroker_oauth_profile_access_level_group.oauthProfileAccessLevelGroups[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.OauthProfileAccessLevelGroupVpnAccessLevelExceptions : "${v.oauthProfileName}.${v.groupName}.${v.msgVpnName}" => "${urlencode(v.oauthProfileName)}/${urlencode(v.groupName)}/${urlencode(v.msgVpnName)}" if v._import==true
    }

    to = solacebroker_oauth_profile_access_level_group_msg_vpn_access_level_exception.oauthProfileAccessLevelGroupVpnAccessLevelExceptions[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.OauthProfileDefaultVpnAccessLevelExceptions : "${v.oauthProfileName}.${v.msgVpnName}" => "${urlencode(v.oauthProfileName)}/${urlencode(v.msgVpnName)}" if v._import==true
    }

    to = solacebroker_oauth_profile_default_msg_vpn_access_level_exception.oauthProfileDefaultVpnAccessLevelExceptions[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.OauthProfileClientAllowedHosts : "${v.oauthProfileName}.${v.allowedHost}" => "${urlencode(v.oauthProfileName)}/${urlencode(v.allowedHost)}" if v._import==true
    }

    to = solacebroker_oauth_profile_client_allowed_host.oauthProfileClientAllowedHosts[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.OauthProfileClientAuthorizationParameters : "${v.oauthProfileName}.${v.authorizationParameterName}" => "${urlencode(v.oauthProfileName)}/${urlencode(v.authorizationParameterName)}" if v._import==true
    }

    to = solacebroker_oauth_profile_client_authorization_parameter.oauthProfileClientAuthorizationParameters[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.OauthProfileClientRequiredClaims : "${v.oauthProfileName}.${v.clientRequiredClaimName}" => "${urlencode(v.oauthProfileName)}/${urlencode(v.clientRequiredClaimName)}" if v._import==true
    }

    to = solacebroker_oauth_profile_client_required_claim.oauthProfileClientRequiredClaims[each.key]
    id = each.value
}

import {
    for_each = {
        for v in var.OauthProfileResourceServerRequiredClaims : "${v.oauthProfileName}.${v.resourceServerRequiredClaimName}" => "${urlencode(v.oauthProfileName)}/${urlencode(v.resourceServerRequiredClaimName)}" if v._import==true
    }

    to = solacebroker_oauth_profile_resource_server_required_claim.oauthProfileResourceServerRequiredClaims[each.key]
    id = each.value
}
    