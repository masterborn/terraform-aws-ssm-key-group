resource "aws_ssm_parameter" "default" {
  for_each = {
    for variable, value in var.env_object :
    variable => value if value != ""
  }

  name        = "/${join("/", var.name_parts)}/${each.key}"
  description = var.description
  type        = var.type
  value       = each.value
  key_id      = var.key_id

  tags = local.tags
}
