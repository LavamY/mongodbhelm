variable "cluster-name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default = "minikube"
}
variable "MONGO_DB_RELEASE" {
  description = "String to fully override mongodb.fullname template"
  type        = string
  default = ""
}
variable "MONGO_DB_ROOT_PASSWORD" {
  description = "MongoDB(R) root password"
  type        = string
  default = ""
}
variable "MONGO_DB_USER" {
  description = "MongoDB(R) custom user "
  type        = string
  default = ""
}
variable "MONGO_DB_PASSWORD" {
  description = "MongoDB(R) custom user's password"
  type        = string
  default = ""
}
variable "MONGO_DB_NAME" {
  description = "MongoDB(R) custom database"
  type        = string
  default = ""
}
variable "mongodb_initConfigMap_name" {
  description = "Existing ConfigMap with custom init script"
  type        = string
  default = ""
}
