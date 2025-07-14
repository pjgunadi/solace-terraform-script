variable "VirtualHostnames" {
    type = list(object({
        virtualHostname = string
        enabled = optional(bool)
        msgVpnName = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}