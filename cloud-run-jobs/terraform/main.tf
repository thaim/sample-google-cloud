resource "google_cloud_run_v2_job" "default" {
  name                = "sample-cloudrun-job"
  location            = "asia-northeast1"
  deletion_protection = false

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }

      timeout = "60s"
    }
  }
}

# 24時間を越えるtimeoutを指定する場合はlaunch_stage = BETAを指定する。
# 最大168時間(7日)まで指定可能。2024-11-25にpreviewリリース。
resource "google_cloud_run_v2_job" "long_running" {
  name                = "sample-cloudrun-job-long-running"
  location            = "asia-northeast1"
  deletion_protection = false

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }

      timeout = "172800s" # 48hour
    }
  }

  launch_stage = "BETA"
}
