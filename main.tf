resource "google_cloud_run_v2_service" "main" {
  name     = var.service_name
  location = var.location
  project  = var.project_id

  template {
    scaling {
      max_instance_count = var.max_instance_count
    }

    dynamic "volumes" {
      for_each = length(var.cloudsql_instances) > 0 ? [1] : []
      content {
        name = "cloudsql"
        cloud_sql_instance {
          instances = var.cloudsql_instances
        }
      }
    }

    containers {
      image = var.image
      ports {
        container_port = var.port
      }

      dynamic "env" {
        for_each = var.env_vars
        content {
          name  = env.key
          value = env.value
        }
      }

      dynamic "env" {
        for_each = var.env_secret_vars
        content {
          name = env.key
          value_source {
            secret_key_ref {
              secret  = env.value.secret
              version = env.value.version
            }
          }
        }
      }

      dynamic "volume_mounts" {
        for_each = length(var.cloudsql_instances) > 0 ? [1] : []

        content {
          name       = "cloudsql"
          mount_path = "/cloudsql"
        }
      }
    }
    service_account = var.service_account_mail
  }

  lifecycle {
    ignore_changes = [
      template[0].containers[0].image,
    ]
  }
}


resource "google_cloud_run_service_iam_member" "public_invoker" {
  count    = var.is_public ? 1 : 0
  location = google_cloud_run_v2_service.main.location
  project  = google_cloud_run_v2_service.main.project
  service  = google_cloud_run_v2_service.main.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_service_iam_member" "private_invoker" {
  for_each = var.private_access_iam_members
  location = google_cloud_run_v2_service.main.location
  project  = google_cloud_run_v2_service.main.project
  service  = google_cloud_run_v2_service.main.name
  role     = "roles/run.invoker"
  member   = each.key
}
