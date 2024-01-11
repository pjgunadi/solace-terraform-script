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
    }))
    default = []
}

variable "ClientUsernameAttributes" {
    type = list(object({
        clientUsername = string
        msgVpnName = string
        attributeName = string
        attributeValue = string
    }))
    default = []
}