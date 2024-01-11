variable "CertMatchingRules" {
    type = list(object({
        msgVpnName = string
        ruleName = string
        enabled = optional(bool)
    }))
    default = []
}

variable "CertMatchingRuleAttributeFilters" {
    type = list(object({
        msgVpnName = string
        filterName = string
        ruleName = string
        attributeName = optional(string)
        attributeValue = optional(string)
 
    }))
    default = []
}

variable "CertMatchingRuleConditions" {
    type = list(object({
        msgVpnName = string
        ruleName = string
        source = string
        attribute = optional(string)
        expression = optional(string)
 
    }))
    default = []
}