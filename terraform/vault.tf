locals {
  vault_display_name = "emby-vault"
  vault_vault_type   = "DEFAULT"
}

resource "oci_kms_vault" "emby_vault" {
  compartment_id = var.compartment_ocid
  display_name   = local.vault_display_name
  vault_type     = local.vault_vault_type
}
