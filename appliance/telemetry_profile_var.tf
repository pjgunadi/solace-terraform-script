variable "TelemetryProfiles" {
    type = list(object({
        msgVpnName = string
        telemetryProfileName = string
        queueEventBindCountThreshold = optional(map(number))
        queueEventMsgSpoolUsageThreshold = optional(map(number))
        queueMaxBindCount = optional(number)
        queueMaxMsgSpoolUsage = optional(number)
        receiverAclConnectDefaultAction = optional(string)
        receiverEnabled = optional(bool)
        receiverEventConnectionCountPerClientUsernameThreshold = optional(map(number))
        receiverMaxConnectionCountPerClientUsername = optional(number)
        receiverTcpCongestionWindowSize = optional(number)
        receiverTcpKeepaliveCount = optional(number)
        receiverTcpKeepaliveIdleTime = optional(number)
        receiverTcpKeepaliveInterval = optional(number)
        receiverTcpMaxSegmentSize = optional(number)
        receiverTcpMaxWindowSize = optional(number)
        traceEnabled = optional(bool)
        traceSendSpanGenerationEnabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "TelemetryProfileReceiverAclConnectExceptions" {
    type = list(object({
        msgVpnName = string
        telemetryProfileName = string
        receiverAclConnectExceptionAddress = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "TelemetryProfileTraceFilters" {
    type = list(object({
        msgVpnName = string
        telemetryProfileName = string
        traceFilterName = string
        enabled = optional(bool)
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}

variable "TelemetryProfileTraceFilterSubscriptions" {
    type = list(object({
        msgVpnName = string
        telemetryProfileName = string
        traceFilterName = string
        subscription = string
        subscriptionSyntax = string
        #Import Flag 
        _import = optional(bool)
    }))
    default = []
}