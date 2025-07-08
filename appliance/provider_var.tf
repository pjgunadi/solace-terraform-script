variable "solace_host" {
    type = object({
        url = string
        username = optional(string)
        password = optional(string)
        bearerToken = optional(string)
        insecureSkipVerify = optional(bool)
        requestMinInterval = optional(string)
        requestTimeoutDuration = optional(string)
        retries = optional(number)
        retryMaxInterval = optional(string)
        retryMinInterval = optional(string)
        skipApiCheck = optional(bool)
    })
}