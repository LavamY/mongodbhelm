terraform {
  source = "/Users/layadav/Desktop/Lavam/hux/Config-Maps/combined_modules"
}
remote_state {
    backend = "azurerm"
    generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
    }
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "lavamrsg"
        storage_account_name = "lavamsaa"
        container_name = "lavamtfstate"
        key = "lavam.terraform.tfstate"
    }
}
inputs = {
    MONGO_DB_ROOT_PASSWORD_PIN     = "password"
    MONGO_DB_USER_PIN              = "pinuser"
    MONGO_DB_PASSWORD_PIN          = "password"
    MONGO_DB_NAME_PIN              = "pindb"
    MONGO_DB_ROOT_PASSWORD_STITCH  = "password"
    MONGO_DB_USER_STITCH           = "stitchuser"
    MONGO_DB_PASSWORD_STITCH       = "password"
    MONGO_DB_NAME_STITCH           = "stitchdb"


}