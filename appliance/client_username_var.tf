variable "ClientUsernames" {
    type = list(object({
        clientUsername = string
        msgVpnName = string
        aclProfileName = optional(string)
        clientProfileName = optional(string)
        enabled = optional(bool)
        guaranteedEndpointPermissionOverrideEnabled = optional(bool)
        password = optional(string)
        subscriptionManagerEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "ClientUsernameAttributes" {
    type = list(object({
        clientUsername = string
        msgVpnName = string
        attributeName = string
        attributeValue = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}