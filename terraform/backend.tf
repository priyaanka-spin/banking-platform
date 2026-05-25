terraform {
  backend "gcs" {
    bucket = "terraform-state-priyaanka2235"
    prefix = "terraform/state"
  }
}
