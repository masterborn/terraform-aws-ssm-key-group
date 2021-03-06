# terraform-aws-ssm-key-group

Resource that allows to declare multiple variables in map, and for each of them creates a new [AWS SSM](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ssm-parameter.html) key resource.

<!-- START_OF_AUTO_GENERATED_SECTION -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.27.0 |
## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.27.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_parts"></a> [name\_parts](#input\_name\_parts) | Parts of ssm variable name | `list(string)` | n/a | yes |
| <a name="input_env_object"></a> [env\_object](#input\_env\_object) | Map with ssm variable name and its value | `map(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description that will be passed to each variable | `string` | `""` | no |
| <a name="input_type"></a> [type](#input\_type) | Available (String, StringList, SecureString) | `string` | `"String"` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | Key id that will be passed to each variable | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags of resource. Provided values will be merged with default\_tags | `map(string)` | `{}` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags that will be merged with var.tags | `map(string)` | <pre>{<br>  "ManagedBy": "terraform",<br>  "Module": "ssm-key-group"<br>}</pre> | no |


## Examples

### Basic example
```hcl
module "string_ssm_keys" {
  source     = "git@github.com:masterborn/terraform-aws-ssm-key-group.git?ref=v1.0.2"
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
```

### Secure string example
```hcl
module "secure_string_ssm_keys" {
  source     = "git@github.com:masterborn/terraform-aws-ssm-key-group.git?ref=v1.0.2"
  name_parts = [local.tags["Module"]]

  type   = "SecureString"
  key_id = module.main-kms.key_id

  env_object = var.secret_string_keys

  tags = local.tags
}
```
<!-- END_OF_AUTO_GENERATED_SECTION -->

## Enabling pre-commit hooks

Following pre-commit hooks are provided:

- [terraform-fmt](https://github.com/antonbabenko/pre-commit-terraform#terraform_fmt) to check syntax of terraform
- [terraform-docs](https://github.com/terraform-docs/terraform-docs) to recreate README.md according to terraform module properties
- [end-of-file-fixer](https://github.com/pre-commit/pre-commit-hooks#end-of-file-fixer) to ensure that each file ends with newline

### Requirements

- [pre-commit](https://pre-commit.com/#installation)

### Installation
To install `pre-commit` check .

```bash
pre-commit install
```
