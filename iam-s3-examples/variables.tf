variable "pgp_keys" {
  description = "Available PGP keys."
  type        = "map"

  default = {
    "720891768192" = "keybase:austinjalexander"
  }
}
