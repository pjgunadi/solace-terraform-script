
variable "RestDeliveryPoints" {
    type = list(object({
        msgVpnName = string
        restDeliveryPointName = string
        clientProfileName = optional(string)
        enabled = optional(bool)
        service = optional(string)
        vendor = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "RdpQueueBindings" {
    type = list(object({
        msgVpnName = string
        restDeliveryPointName = string
        queueBindingName = string
        gatewayReplaceTargetAuthorityEnabled = optional(bool)
        postRequestTarget = optional(string)
        requestTargetEvaluation = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "RdpQueueBindingProtectedRequestHeaders" {
    type = list(object({
        msgVpnName = string
        restDeliveryPointName = string
        queueBindingName = string
        headerName = string
        headerValue = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "RdpQueueBindingRequestHeaders" {
    type = list(object({
        msgVpnName = string
        restDeliveryPointName = string
        queueBindingName = string
        headerName = string
        headerValue = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "RdpRestConsumers" {
    type = list(object({
        msgVpnName = string
        restConsumerName = string
        restDeliveryPointName = string
        authenticationAwsAccessKeyId = optional(string)
        authenticationAwsRegion = optional(string)
        authenticationAwsSecretAccessKey = optional(string)
        authenticationAwsService = optional(string)
        authenticationClientCertContent = optional(string)
        authenticationClientCertPassword = optional(string)
        authenticationHttpBasicPassword = optional(string)
        authenticationHttpBasicUsername = optional(string)
        authenticationHttpHeaderName = optional(string)
        authenticationHttpHeaderValue = optional(string)
        authenticationOauthClientId = optional(string)
        authenticationOauthClientScope = optional(string)
        authenticationOauthClientSecret = optional(string)
        authenticationOauthClientTokenEndpoint = optional(string)
        authenticationOauthClientTokenExpiryDefault = optional(number)
        authenticationOauthJwtSecretKey = optional(string)
        authenticationOauthJwtTokenEndpoint = optional(string)
        authenticationOauthJwtTokenExpiryDefault = optional(number)
        authenticationScheme = optional(string)
        enabled = optional(bool)
        httpMethod = optional(string)
        localInterface = optional(string)
        maxPostWaitTime = optional(number)
        outgoingConnectionCount = optional(number)
        proxyName = optional(string)
        remoteHost = optional(string)
        remotePort = optional(number)
        retryDelay = optional(number)
        tlsCipherSuiteList = optional(string)
        tlsEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "RdpRestConsumerOauthJwtClaims" {
    type = list(object({
        msgVpnName = string
        restDeliveryPointName = string
        restConsumerName = string
        oauthJwtClaimName = string
        oauthJwtClaimValue = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}