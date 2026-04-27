# Terraform-DigitalOcean Provisioning

## File Structure
### Root
- `main.tf` - contains all of the `module`|`resource`|`data` _block_ directives
- `outputs.tf` - contains all `output` _block_ directives
- `providers.tf` - contains all of the `provider` _block_ directives
- `variables.tf` - contains all of the `variable` block directives
- `versions.tf` - contains the `terraform` _block_ with `provider`|`backend` specs

### Modules
- `lifecycles.tf` - contains the `resource` _block_ related to resource lifecycles
- `provisioners.tf` - contains the `resource` _block_ related to resource provisionings

## Providers
- [DigitalOcean](https://registry.terraform.io/providers/digitalocean/digitalocean/latest)
- [Gitlab](https://registry.terraform.io/providers/gitlabhq/gitlab/latest)
