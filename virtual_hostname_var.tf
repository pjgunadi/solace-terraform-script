variable "VirtualHostnames" {
    type = list(object({
        virtualHostname = string
        enabled = optional(bool)
        msgVpnName = optional(string)
    }))
    default = []
}