locals {
  bucket_name = "bucket"
  namespace   = "frau7ohucd40"
}

resource "oci_objectstorage_bucket" "emby" {
  #Required
  compartment_id = var.compartment_ocid
  name           = local.bucket_name
  namespace      = local.namespace

  #Optional
  access_type           = "NoPublicAccess"
  auto_tiering          = "Disabled"
  object_events_enabled = false
  storage_tier          = "Standard"
  versioning            = "Disabled"
}
