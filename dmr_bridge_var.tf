variable "DmrBridges" {
    type = list(object({
        msgVpnName = string
        remoteNodeName = string
        remoteMsgVpnName = optional(string)

    }))
    default = []
}