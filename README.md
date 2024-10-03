<!-- BEGIN_TF_DOCS -->
## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image"></a> [image](#input\_image) | The container image to deploy. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which resources will be managed. | `string` | n/a | yes |
| <a name="input_service_account_mail"></a> [service\_account\_mail](#input\_service\_account\_mail) | Service account used for the cloud run container | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the Cloud Run service. | `string` | n/a | yes |
| <a name="input_cloudsql_instances"></a> [cloudsql\_instances](#input\_cloudsql\_instances) | CloudSQL instances to connect to | `list(string)` | `[]` | no |
| <a name="input_env_secret_vars"></a> [env\_secret\_vars](#input\_env\_secret\_vars) | Secret environment variables to set in the container | <pre>map(object({<br>    secret  = string<br>    version = string<br>  }))</pre> | `{}` | no |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | Environment variables to set in the container | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the cloud run service. | `string` | `"europe-west1"` | no |
| <a name="input_max_instance_count"></a> [max\_instance\_count](#input\_max\_instance\_count) | Max instance the cloud run can launch | `number` | `2` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the container is listening for incoming HTTP requests. | `number` | `8080` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | n/a |
<!-- END_TF_DOCS -->