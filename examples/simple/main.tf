module "cloudrun-cloudsql-example" {
  source = "../.."

  project_id           = var.project_id
  image                = "us-docker.pkg.dev/cloudrun/container/hello"
  service_name         = "hello"
  service_account_mail = var.service_account_mail
}
