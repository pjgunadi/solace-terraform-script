variable "solace_cloud" {
    type = object({
        uri = optional(string)
        insecure = optional(bool)
        write_returns_object = optional(bool)
        debug = optional(bool)
        service_id = optional(string)
        token = optional(string)
    })
    default = {
        uri = "https://change_to_solace_cloud_api_url"
        insecure = false
        service_id = "your_solace_cloud_service_id"
        token = "your_solace_cloud_access_token"
    }
}

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

variable "is_old_cloud_service" {
    description = "Solace Broker Cloud Service Flag"
    type = bool
    default = false
}