
locals {
mongodb = {
    name           = "hux-mongodb1"
    namespace      = "default"
    repository     = "https://charts.bitnami.com/bitnami"
    chart          = "mongodb"
    chart_version  = "10.10.2"
    enabled        = true
    default_values = local.mongodb_values
    }
    mongodb_values = <<ENDYAML
    fullnameOverride: ${var.MONGO_DB_RELEASE}
    auth:
      rootPassword: ${var.MONGO_DB_ROOT_PASSWORD}
      username: ${var.MONGO_DB_USER}
      password: ${var.MONGO_DB_PASSWORD}
      database: ${var.MONGO_DB_NAME}
    initdbScriptsConfigMap: ${var.mongodb_initConfigMap_name}
    
    ENDYAML
}
module "mongodb-helm" {
  source      = "/Users/layadav/Desktop/Lavam/hux/mongodb-terraform/helm_deploy"
  helm_config = local.mongodb
}
