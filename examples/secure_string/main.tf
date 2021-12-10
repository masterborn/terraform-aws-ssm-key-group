module "secure_string_ssm_keys" {
  source     = "git@github.com:masterborn/terraform-aws-ssm-key-group.git?ref={{ provider_version }}"
  name_parts = [local.tags["Module"]]

  type   = "SecureString"
  key_id = module.main-kms.key_id

  env_object = var.secret_string_keys

  tags = local.tags
}
