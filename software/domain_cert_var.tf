variable "DomainCertAuthorities" {
    type = list(object({
        certAuthorityName = string
        certContent = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}