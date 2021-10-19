module "mongoDB" {
  source = "/Users/layadav/Desktop/Lavam/hux/mongodb-terraform/mongo-db"
  MONGO_DB_ROOT_PASSWORD     = "${var.MONGO_DB_ROOT_PASSWORD_PIN}"
  MONGO_DB_USER              = "${var.MONGO_DB_USER_PIN}"
  MONGO_DB_PASSWORD          = "${var.MONGO_DB_PASSWORD_PIN}"
  MONGO_DB_NAME              = "${var.MONGO_DB_NAME_PIN}"
  mongodb_initConfigMap_name = kubernetes_config_map.pinningdb_config.metadata.0.name

}
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_config_map" "pinningdb_config" {
  metadata {
    name = "pinningdbinitconfigmap"
  }

  data = {
    "pinning-db-init.js" = "${file("${path.module}/pinning-db-init.js.j2")}"
  }

}

data "kubernetes_config_map" "pinningdb_config" {
  metadata {
    name = "pinningingdbinitconfigmap"
  }
}