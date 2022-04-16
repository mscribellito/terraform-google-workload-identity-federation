variable "project_id" {
  type        = string
  description = "The ID of the project"
}

# Identity pool

variable "pool_id" {
  type        = string
  description = "Workload Identity Pool ID"

  validation {
    condition     = substr(var.pool_id, 0, 4) != "gcp-" && length(regex("([a-z0-9-]{4,32})", var.pool_id)) == 1
    error_message = "The pool_id value should be 4-32 characters, and may contain the characters [a-z0-9-]."
  }
}

variable "pool_display_name" {
  type        = string
  description = "Workload Identity Pool display name"
  default     = null
}

variable "pool_description" {
  type        = string
  description = "Workload Identity Pool description"
  default     = "Workload Identity Pool managed by Terraform"
}

variable "pool_disabled" {
  type        = bool
  description = "Workload Identity Pool disabled"
  default     = false
}

# Identity pool provider

variable "provider_id" {
  type        = string
  description = "Workload Identity Pool Provider ID"

  validation {
    condition     = substr(var.provider_id, 0, 4) != "gcp-" && length(regex("([a-z0-9-]{4,32})", var.provider_id)) == 1
    error_message = "The provider_id value should be 4-32 characters, and may contain the characters [a-z0-9-]."
  }
}

variable "provider_display_name" {
  type        = string
  description = "Workload Identity Pool Provider display name"
  default     = null
}

variable "provider_description" {
  type        = string
  description = "Workload Identity Pool Provider description"
  default     = "Workload Identity Pool Provider managed by Terraform"
}

variable "provider_disabled" {
  type        = bool
  description = "Workload Identity Pool Provider disabled"
  default     = false
}

variable "attribute_mapping" {
  type        = map(any)
  description = "Workload Identity Pool Provider attribute mapping"
}

variable "attribute_condition" {
  type        = string
  description = "Workload Identity Pool Provider attribute condition expression"
  default     = null
}

variable "allowed_audiences" {
  type        = list(string)
  description = "Workload Identity Pool Provider allowed audiences"
  default     = []
}

variable "issuer_uri" {
  type        = string
  description = "Workload Identity Pool Provider issuer URL"
}

# Service account impersonation

variable "service_accounts" {
  type = list(object({
    name           = string
    attribute      = string
    all_identities = bool
  }))
  description = "Service Account resource names and corresponding provider attributes"
}
