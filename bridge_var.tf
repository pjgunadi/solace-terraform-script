variable "Bridges" {
    type = list(object({
        bridgeName = string
        bridgeVirtualRouter = string
        msgVpnName = string
        enabled = optional(bool)
        maxTtl = optional(number)
        remoteAuthenticationBasicClientUsername = optional(string)
        remoteAuthenticationBasicPassword = optional(string)
        remoteAuthenticationClientCertContent = optional(string)
        remoteAuthenticationClientCertPassword = optional(string)
        remoteAuthenticationScheme = optional(string)
        remoteConnectionRetryCount = optional(number)
        remoteConnectionRetryDelay = optional(number)
        remoteDeliverToOnePriority = optional(string)
        tlsCipherSuiteList = optional(string)
    }))
    default = []
}

variable "RemoteMsgVpns" {
    type = list(object({
        bridgeName = string
        bridgeVirtualRouter = string
        msgVpnName = string
        remoteMsgVpnName = string
        remoteMsgVpnLocation = string
        remoteMsgVpnInterface = string
        clientUsername = optional(string)
        compressedDataEnabled = optional(bool)
        connectOrder = optional(number)
        egressFlowWindowSize = optional(number)
        enabled = optional(bool)
        password = optional(string)
        queueBinding = optional(string)
        tlsEnabled = optional(bool)
        unidirectionalClientProfile = optional(string)
        
    }))
    default = []
}

variable "RemoteSubscriptions" {
    type = list(object({
        bridgeName = string
        bridgeVirtualRouter = string
        msgVpnName = string
        remoteSubscriptionTopic = string
        deliverAlwaysEnabled = optional(bool)

    }))
    default = []
}