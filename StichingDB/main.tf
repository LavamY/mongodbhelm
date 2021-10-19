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

resource "kubernetes_config_map" "stitchingdb_config" {
  metadata {
    name = "stitchingdbinitconfigmap"
  }

  data = {
    "stitch-db-init.js" = "${file("${path.module}/stitch-db-init.js.j2")}"
  }

}

module "mongoDB" {
  source = "/Users/layadav/Desktop/Lavam/hux/mongodb-terraform/mongo-db"
  MONGO_DB_ROOT_PASSWORD     = "${var.MONGO_DB_ROOT_PASSWORD_STITCH}"
  MONGO_DB_USER              = "${var.MONGO_DB_USER_STITCH}"
  MONGO_DB_PASSWORD          = "${var.MONGO_DB_PASSWORD_STITCH}"
  MONGO_DB_NAME              = "${var.MONGO_DB_NAME_STITCH}"
  mongodb_initConfigMap_name = kubernetes_config_map.stitchingdb_config.metadata.0.name

}

data "kubernetes_config_map" "stitchingdb_config" {
  metadata {
    name = "stitchingdbinitconfigmap"
  }
}
