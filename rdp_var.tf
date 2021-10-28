
variable "RestDeliveryPoints" {
    type = map(object({
        msgVpnName = string
        restDeliveryPointName = string
        enabled = bool
        clientProfileName = string
        service = string
        vendor = string
    }))
    default = {}
}

variable "RdpQueueBindings" {
    type = map(object({
        msgVpnName = string
        restDeliveryPointName = string
        queueBindingName = string
        gatewayReplaceTargetAuthorityEnabled = bool
        postRequestTarget = string
        requestTargetEvaluation = string
    }))
    default = {}
}

variable "RdpQueueBindingRequestHeaders" {
    type = map(object({
        msgVpnName = string
        restDeliveryPointName = string
        queueBindingName = string
        headerName = string
        headerValue = string
    }))
    default = {}
}

variable "RdpRestConsumers" {
    type = map(object({
        msgVpnName = string
        restDeliveryPointName = string
        restConsumerName = string
        enabled = bool
        authenticationClientCertContent = string
        authenticationClientCertPassword = string
        authenticationHttpBasicPassword = string
        authenticationHttpBasicUsername = string
        authenticationHttpHeaderName = string
        authenticationHttpHeaderValue = string
        authenticationOauthClientId = string
        authenticationOauthClientScope = string
        authenticationOauthClientSecret = string
        authenticationOauthClientTokenEndpoint = string
        authenticationOauthJwtSecretKey = string
        authenticationOauthJwtTokenEndpoint = string
        authenticationScheme = string
        httpMethod = string
        remoteHost = string
        remotePort = number
        tlsEnabled = bool
    }))
    default = {}
}

variable "RdpRestConsumerOauthJwtClaims" {
    type = map(object({
        msgVpnName = string
        restDeliveryPointName = string
        restConsumerName = string
        oauthJwtClaimName = string
        oauthJwtClaimValue = string
    }))
    default = {}
}