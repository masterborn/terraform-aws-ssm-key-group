locals {
  tags = merge(var.tags, var.default_tags)
}

variable "name_parts" {
  description = "Parts of ssm variable name"
  type        = list(string)
}

variable "env_object" {
  description = "Map with ssm variable name and its value"
  type        = map(string)
}

variable "description" {
  description = "Description that will be passed to each variable"
  default     = ""
}

variable "type" {
  description = "Available (String, StringList, SecureString)"
  default     = "String"

  validation {
    condition     = contains(["String", "StringList", "SecureString"], var.type)
    error_message = "Allowed values for var.type are \"String\", \"StringList\", or \"SecureString\"."
  }
}

variable "key_id" {
  description = "Key id that will be passed to each variable"
  default     = null
}

variable "tags" {
  description = "Tags of resource. Provided values will be merged with default_tags"
  type        = map(string)
  default     = {}
}

variable "default_tags" {
  description = "Default tags that will be merged with var.tags"
  type        = map(string)
  default = {
    ManagedBy = "terraform"
    Module    = "ssm-key-group"
  }
}
