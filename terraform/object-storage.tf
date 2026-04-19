locals {
  bucket_name = "bucket"
}

data "oci_objectstorage_namespace" "emby" {
  compartment_id = var.compartment_ocid
}

data "oci_identity_compartment" "emby" {
  #Required
  id = var.compartment_ocid
}

resource "oci_objectstorage_bucket" "emby" {
  #Required
  compartment_id = var.compartment_ocid
  name           = local.bucket_name
  namespace      = data.oci_objectstorage_namespace.emby.namespace

  #Optional
  access_type           = "NoPublicAccess"
  auto_tiering          = "Disabled"
  object_events_enabled = false
  storage_tier          = "Standard"
  versioning            = "Disabled"
}

resource "oci_identity_user" "bucket_identity" {
  compartment_id = var.tenancy_ocid
  name           = "emby-bucket-identity-user"
  description    = "Service account for emby object storage"
  email          = "admin@emby.red"
}

resource "oci_identity_group" "bucket_identity_group" {
  compartment_id = var.tenancy_ocid
  name           = "emby-bucket-identity-group"
  description    = "Group for emby object storage service account"
}

resource "oci_identity_user_group_membership" "bucket_identity_membership" {
  group_id = oci_identity_group.bucket_identity_group.id
  user_id  = oci_identity_user.bucket_identity.id
}

resource "oci_identity_policy" "bucket_identity_policy" {
  compartment_id = var.compartment_ocid
  name           = "emby-bucket-identity-policy"
  description    = "Allow service account to access object storage bucket"
  statements = [
    "Allow group emby-bucket-identity-group to manage objects in compartment ${data.oci_identity_compartment.emby.name} where target.bucket.name='${oci_objectstorage_bucket.emby.name}'",
    "Allow group emby-bucket-identity-group to read buckets in compartment ${data.oci_identity_compartment.emby.name}",
  ]
}

resource "oci_identity_customer_secret_key" "bucket_identity_secret_key" {
  user_id      = oci_identity_user.bucket_identity.id
  display_name = "emby-bucket-identity-s3-key"
}
