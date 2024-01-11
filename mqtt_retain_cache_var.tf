variable "MqttRetainCaches" {
    type = list(object({
        msgVpnName = string
        cacheName = string
        enabled = optional(bool)
        msgLifetime = optional(number)
    }))
    default = []
}