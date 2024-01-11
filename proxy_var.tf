variable "Proxies" {
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
    }))
    default = []
}