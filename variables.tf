locals {
  tags = merge(var.tags, var.default_tags)
}

variable "name_parts" {
  type = list(string)
}

variable "env_object" {
  type = map(string)
}

variable "description" {
  description = ""
  default = ""
}

variable "type" {
  description = "Available (String, StringList, SecureString), default String"
  default = "String"
}

variable "key_id" {
  description = ""
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "default_tags" {
  type = map(string)
  default = {
    ManagedBy = "terraform"
    Module    = "ssm-key-group"
  }
}
