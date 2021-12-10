module "string_ssm_keys" {
  source     = "git@github.com:masterborn/terraform-aws-ssm-key-group.git?ref={{ provider_version }}"
  name_parts = [local.tags["Module"]]

  env_object = merge(
    {
      VPC_ID     = var.vpc_id
      SUBNET_IDS = join(",", var.subnet_ids)
      NODE_ENV   = "production"
    },
    var.string_keys
  )

  tags = local.tags
}
