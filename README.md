# terraform-aws-ssm-key-group

Resource that allows to declare multiple variables in map, and for each of them creates new ssm resource.

## Examples

### Basic example 
```hcl
module "string_ssm_keys" {
  source = "git@github.com:masterborn/terraform-aws-ssm-key-group.git"
  name_parts = [local.tags["Module"]]

  env_object = merge(
    {
      VPC_ID = var.vpc_id
      SUBNET_IDS = join(",", var.subnet_ids)
      NODE_ENV = "production"
    },
    var.string_keys
   )

  tags = local.tags
}
```

### Secure string example
```hcl
module "secure_string_ssm_keys" {
  source = "git@github.com:masterborn/terraform-aws-ssm-key-group.git"
  name_parts = [local.tags["Module"]]

  type   = "SecureString"
  key_id = module.main-kms.key_id

  env_object = var.secret_string_keys

  tags = local.tags
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_parts"></a> [name\_parts](#input\_name\_parts) | Parts of ssm variable name | `list(string)` | n/a | yes |
| <a name="input_env_object"></a> [env\_object](#input\_env\_object) | Map with ssm variable name and its value | `map(string)` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Available (String, StringList, SecureString) | `string` | `"String"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description that will be passed to each variable | `string` | `""` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | Key id that will be passed to each variable | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags of resource. Provided values will be merged with default ones | `map(string)` | <pre>{<br>  "ManagedBy": "terraform",<br>  "Module": "ssm-key-group"<br>}</pre> | no |

## Outputs

No outputs.