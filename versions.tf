terraform {
  required_version = ">= 1.14.8"

  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.2.1"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 18.9.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "http" {}
}
