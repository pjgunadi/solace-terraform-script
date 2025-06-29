variable "DmrBridges" {
    type = list(object({
        msgVpnName = string
        remoteNodeName = string
        remoteMsgVpnName = optional(string)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}