variable "region" {
  description = "OCI region"
  type        = string
}
variable "tenancy_ocid" {
  description = "OCI tenancy"
  type        = string
}
variable "user_ocid" {
  description = "OCI user"
  type        = string
}
variable "fingerprint" {
  description = "OCI API key fingreprint"
  type        = string
}
variable "private_key" {
  description = "OCI API private key"
  type        = string
}
variable "compartment_ocid" {
  description = "OCI compartment"
  type        = string
}
variable "public_key" {
  description = "public ssh key"
  type        = string
}

variable "cluster_ip" {
  description = "cluster IP"
  type        = string
  default     = "127.0.0.1/32"
}
