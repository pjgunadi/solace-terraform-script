variable "AuthenticationKerberosRealms" {
    type = list(object({
        msgVpnName = string
        kerberosRealmName = string
        enabled = optional(bool)
        kdcAddress = optional(string)
    }))
    default = []
}