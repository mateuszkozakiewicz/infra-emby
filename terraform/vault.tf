locals {
  vault_display_name      = "emby-vault"
  vault_vault_type        = "DEFAULT"
  key_display_name        = "emby-vault-master-key"
  key_key_shape_algorithm = "AES"
  key_key_shape_length    = 32
}

resource "oci_kms_vault" "emby_vault" {
  compartment_id = var.compartment_ocid
  display_name   = local.vault_display_name
  vault_type     = local.vault_vault_type
}

resource "oci_kms_key" "emby_vault_master_key" {
  compartment_id = var.compartment_ocid
  display_name   = local.key_display_name
  key_shape {
    algorithm = local.key_key_shape_algorithm
    length    = local.key_key_shape_length
  }
  management_endpoint = oci_kms_vault.emby_vault.management_endpoint
  protection_mode     = "HSM"
}
