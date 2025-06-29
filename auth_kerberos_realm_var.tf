variable "AuthenticationKerberosRealms" {
    type = list(object({
        msgVpnName = string
        kerberosRealmName = string
        enabled = optional(bool)
        kdcAddress = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}