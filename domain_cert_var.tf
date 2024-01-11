variable "DomainCertAuthorities" {
    type = list(object({
        certAuthorityName = string
        certContent = optional(string)
    }))
    default = []
}