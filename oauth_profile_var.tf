variable "OauthProfiles" {
    type = list(object({
        oauthProfileName = string
        accessLevelGroupsClaimName = string
        accessLevelGroupsClaimStringFormat = optional(string)
        clientId = optional(string)
        clientRedirectUri = optional(string)
        clientRequiredType = optional(string)
        clientScope = optional(string)
        clientSecret = optional(string)
        clientValidateTypeEnabled = optional(bool)
        defaultGlobalAccessLevel = optional(string)
        defaultMsgVpnAccessLevel = optional(string)
        displayName = optional(string)
        enabled = optional(bool)
        endpointAuthorization = optional(string)
        endpointDiscovery = optional(string)
        endpointDiscoveryRefreshInterval = optional(number)
        endpointIntrospection = optional(string)
        endpointIntrospectionTimeout = optional(number)
        endpointJwks = optional(string)
        endpointJwksRefreshInterval = optional(number)
        endpointToken = optional(string)
        endpointTokenTimeout = optional(number)
        endpointUserinfo = optional(string)
        endpointUserinfoTimeout = optional(number)
        interactiveEnabled = optional(bool)
        interactivePromptForExpiredSession = optional(string)
        interactivePromptForNewSession = optional(string)
        issuer = optional(string)
        oauthRole = optional(string)
        resourceServerParseAccessTokenEnabled = optional(bool)
        resourceServerRequiredAudience = optional(string)
        resourceServerRequiredIssuer = optional(string)
        resourceServerRequiredScope = optional(string)
        resourceServerRequiredType = optional(string)
        resourceServerValidateAudienceEnabled = optional(bool)
        resourceServerValidateIssuerEnabled = optional(bool)
        resourceServerValidateScopeEnabled = optional(bool)
        resourceServerValidateTypeEnabled = optional(bool)
        sempEnabled = optional(bool)
        usernameClaimName = optional(string)
        
    }))
    default = []
}

variable "OauthProfileAccessLevelGroups" {
    type = list(object({
        oauthProfileName = string
        groupName = string
        description = optional(string)
        globalAccessLevel = optional(string)
        msgVpnAccessLevel = optional(string)
        
    }))
    default = []
}

variable "OauthProfileAccessLevelGroupVpnAccessLevelExceptions" {
    type = list(object({
        oauthProfileName = string
        groupName = string
        msgVpnName = string
        accessLevel = optional(string)
        
    }))
    default = []
}

variable "OauthProfileDefaultVpnAccessLevelExceptions" {
    type = list(object({
        oauthProfileName = string
        msgVpnName = string
        accessLevel = optional(string)
    }))
    default = []
}

variable "OauthProfileClientAllowedHosts" {
    type = list(object({
        oauthProfileName = string
        allowedHost = string
        
    }))
    default = []
}

variable "OauthProfileClientAuthorizationParameters" {
    type = list(object({
        oauthProfileName = string
        authorizationParameterName = string
        authorizationParameterValue = optional(string)
        
    }))
    default = []
}

variable "OauthProfileClientRequiredClaims" {
    type = list(object({
        oauthProfileName = string
        clientRequiredClaimName = string
        clientRequiredClaimValue = string
        
    }))
    default = []
}

variable "OauthProfileResourceServerRequiredClaims" {
    type = list(object({
        oauthProfileName = string
        resourceServerRequiredClaimName = string
        resourceServerRequiredClaimValue = string
    }))
    default = []
}