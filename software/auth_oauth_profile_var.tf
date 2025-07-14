variable "AuthenticationOauthProfiles" {
    type = list(object({
        msgVpnName = string
        oauthProfileName = string
        authorizationGroupsClaimName = optional(string)
        authorizationGroupsClaimStringFormat = optional(string)
        clientId = optional(string)
        clientRequiredType = optional(string)
        clientSecret = optional(string)
        clientValidateTypeEnabled = optional(bool)
        disconnectOnTokenExpirationEnabled = optional(bool)
        enabled = optional(bool)
        endpointDiscovery = optional(string)
        endpointDiscoveryRefreshInterval = optional(number)
        endpointIntrospection = optional(string)
        endpointIntrospectionTimeout = optional(number)
        endpointJwks = optional(string)
        endpointJwksRefreshInterval = optional(number)
        endpointUserinfo = optional(string)
        endpointUserinfoTimeout = optional(number)
        issuer = optional(string)
        mqttUsernameValidateEnabled = optional(bool)
        oauthRole = optional(string)
        proxyName = optional(string)
        resourceServerParseAccessTokenEnabled = optional(bool)
        resourceServerRequiredAudience = optional(string)
        resourceServerRequiredIssuer = optional(string)
        resourceServerRequiredScope = optional(string)
        resourceServerRequiredType = optional(string)
        resourceServerValidateAudienceEnabled = optional(bool)
        resourceServerValidateIssuerEnabled = optional(bool)
        resourceServerValidateScopeEnabled = optional(bool)
        resourceServerValidateTypeEnabled = optional(bool)
        usernameClaimName = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "AuthOauthProfileClientRequiredClaims" {
    type = list(object({
        msgVpnName = string
        oauthProfileName = string
        clientRequiredClaimName = string
        clientRequiredClaimValue = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "AuthOauthProfileResourceServerRequiredClaims" {
    type = list(object({
        msgVpnName = string
        oauthProfileName = string
        resourceServerRequiredClaimName = string
        resourceServerRequiredClaimValue = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}