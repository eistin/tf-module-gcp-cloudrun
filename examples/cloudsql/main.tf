module "cloudrun-cloudsql-example" {
  source = "../.."

  project_id           = var.project_id
  image                = "us-docker.pkg.dev/cloudrun/container/hello"
  service_name         = "hello"
  service_account_mail = var.service_account_mail
  cloudsql_instances   = [var.cloudsql_instances_connection_name]
  is_public            = false
  private_access_iam_members = [
    "user:user1@example.com",
    "serviceAccount:sa1@your-project.iam.gserviceaccount.com"
  ]
  env_vars = {
    "KEY1" = "VALUE1"
    "KEY2" = "VALUE2"
  }
  env_secret_vars = {
    "SECRET_API_KEY" = {
      secret  = "projects/your-project/secrets/api-key"
      version = "latest"
    }
  }
}
