variable "MONGO_DB_ROOT_PASSWORD_PIN" {
  description = "MongoDB(R) root password"
  type        = string
  default = "hasher"
}
variable "MONGO_DB_USER_PIN" {
  description = "MongoDB(R) custom user "
  type        = string
  default = "hasher"
}
variable "MONGO_DB_PASSWORD_PIN" {
  description = "MongoDB(R) custom user's password"
  type        = string
  default = "hasher"
}
variable "MONGO_DB_NAME_PIN" {
  description = "MongoDB(R) custom database"
  type        = string
  default = "hasher"
}
variable "MONGO_DB_ROOT_PASSWORD_STITCH" {
  description = "MongoDB(R) root password"
  type        = string
  default = "hasher"
}
variable "MONGO_DB_USER_STITCH" {
  description = "MongoDB(R) custom user "
  type        = string
  default = "hasher"
}
variable "MONGO_DB_PASSWORD_STITCH" {
  description = "MongoDB(R) custom user's password"
  type        = string
  default = "hasher"
}
variable "MONGO_DB_NAME_STITCH" {
  description = "MongoDB(R) custom database"
  type        = string
  default = "hasher"
}