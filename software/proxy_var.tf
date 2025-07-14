variable "MsgVpnProxies" {
    type = list(object({
        msgVpnName = string
        proxyName = string
        authenticationBasicUsername = optional(string)
        authenticationBasicPassword = optional(string)
        authenticationScheme = optional(string)
        enabled =optional(bool)
        host = optional(string)
        port = optional(number)
        proxyType = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "BrokerProxies" {
    type = list(object({
        proxyName = string
        authenticationBasicUsername = optional(string)
        authenticationBasicPassword = optional(string)
        authenticationScheme = optional(string)
        enabled =optional(bool)
        host = optional(string)
        port = optional(number)
        proxyType = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}