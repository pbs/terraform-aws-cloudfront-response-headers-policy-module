variable "name" {
  description = "Name of the Cloudfront response headers policy module. If null, will default to product."
  default     = null
  type        = string
}

variable "comment" {
  description = "A comment to describe the response headers policy. The comment cannot be longer than 128 characters."
  default     = null
  type        = string
  validation {
    condition     = var.comment == null ? true : length(var.comment) <= 128
    error_message = "The comment cannot be longer than 128 characters."
  }
}

variable "cors_config" {
  description = "CORS configuration"
  default     = null
  type        = any
}

variable "custom_headers" {
  description = "Custom headers"
  default     = null
  type = list(object({
    header   = string
    override = bool
    value    = string
  }))
}

variable "security_headers_config" {
  description = "A configuration for a set of security-related HTTP response headers"
  default     = null
  type        = map(any)
}
