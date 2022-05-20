terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}
variable "ssh_key_fingerprint" {}
variable "private_key" {}
variable "public_key" {}

provider "digitalocean" {
  token = var.do_token
}
