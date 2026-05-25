module "gke" {
  source       = "./modules/gke"
  cluster_name = var.cluster_name
  zone         = var.zone
}
