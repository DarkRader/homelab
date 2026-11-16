variable "secret_id" {
  type        = string
  description = "GCP Secret Manager secret ID"
}

variable "value" {
  type        = string
  default     = null
  sensitive   = true
  description = "Literal secret value (mutually exclusive with generate)"
}

variable "generate" {
  type = object({
    method  = optional(string, "bytes") # "password", "bytes", "base64", or "hex"
    length  = optional(number, 32)
    special = optional(bool, true)
  })
  default     = null
  description = "Random generation config (mutually exclusive with value)"

  validation {
    condition     = var.generate == null ? true : contains(["password", "bytes", "base64", "hex"], var.generate.method)
    error_message = "generate.method must be one of \"password\", \"bytes\", \"base64\", or \"hex\"."
  }
}

variable "manage_version" {
  type        = bool
  default     = true
  description = "Set to false for pre-existing secrets whose values should remain untouched"
}

variable "secret_version" {
  type        = number
  default     = 1
  description = "Increment this number to rotate the generated value and publish a new GCP secret version"
}

variable "labels" {
  type    = map(string)
  default = {}
}

check "value_or_generate_exclusive" {
  assert {
    condition     = !var.manage_version || ((var.value != null) != (var.generate != null))
    error_message = "When manage_version is true, exactly one of `value` or `generate` must be set."
  }
}
