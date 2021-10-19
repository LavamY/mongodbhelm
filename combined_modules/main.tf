module "pinning_db" {
    source                         = "/Users/layadav/Desktop/Lavam/hux/Config-Maps/PinningDB"
    MONGO_DB_ROOT_PASSWORD_PIN     = "${var.MONGO_DB_ROOT_PASSWORD_PIN}"
    MONGO_DB_USER_PIN              = "${var.MONGO_DB_USER_PIN}"
    MONGO_DB_PASSWORD_PIN          = "${var.MONGO_DB_PASSWORD_PIN}"
    MONGO_DB_NAME_PIN              = "${var.MONGO_DB_NAME_PIN}"
    
}
module "stitching_db"{
    source                            = "/Users/layadav/Desktop/Lavam/hux/Config-Maps/StitchingDB"
    MONGO_DB_ROOT_PASSWORD_STITCH     = "${var.MONGO_DB_ROOT_PASSWORD_STITCH}"
    MONGO_DB_USER_STITCH              = "${var.MONGO_DB_USER_STITCH}"
    MONGO_DB_PASSWORD_STITCH          = "${var.MONGO_DB_PASSWORD_STITCH}"
    MONGO_DB_NAME_STITCH              = "${var.MONGO_DB_NAME_STITCH}"
    
}