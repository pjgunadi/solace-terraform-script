variable "ClientCertAuthorities" {
    type = list(object({
        certAuthorityName = string
        certContent = optional(string)
        crlDayList = optional(string)
        crlTimeList = optional(string)
        crlUrl = optional(string)
        ocspNonResponderCertEnabled = optional(bool)
        ocspOverrideUrl = optional(string)
        ocspTimeout = optional(number)
        revocationCheckEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "OcspTlsTrustedCommonNames" {
    type = list(object({
        certAuthorityName = string
        ocspTlsTrustedCommonName = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}