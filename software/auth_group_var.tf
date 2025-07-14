variable "AuthorizationGroups" {
    type = list(object({
        authorizationGroupName = string
        msgVpnName = string
        aclProfileName = optional(string)
        clientProfileName = optional(string)
        enabled = optional(bool)
        orderAfterAuthorizationGroupName = optional(string)
        orderBeforeAuthorizationGroupName = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}