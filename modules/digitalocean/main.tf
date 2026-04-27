locals {
  ssh_key_pair_names = toset([
    "Jio",
  ])
}

data "digitalocean_ssh_keys" "key_pairs" {
  filter {
    key    = "name"
    values = local.ssh_key_pair_names
  }
}

resource "tls_private_key" "gitlab_shared" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "digitalocean_ssh_key" "droplet_shared" {
  name       = "Terraform-generated Public Key"
  public_key = tls_private_key.gitlab_shared.public_key_openssh

  depends_on = [tls_private_key.gitlab_shared]
}

resource "digitalocean_droplet" "gitlab_runner" {
  name              = var.droplet_name
  region            = var.droplet_region
  image             = var.droplet_image
  size              = var.droplet_size
  monitoring        = true
  graceful_shutdown = true

  ssh_keys = concat(
    [digitalocean_ssh_key.droplet_shared.id],
    [for key in data.digitalocean_ssh_keys.key_pairs.ssh_keys : key.id]
  )

  depends_on = [data.digitalocean_ssh_keys.key_pairs, digitalocean_ssh_key.droplet_shared]

  lifecycle {
    replace_triggered_by = [terraform_data.do_droplet_gitlab_runner_lifecycle]
  }
}

data "digitalocean_project" "gitlab_runner" {
  name = "Gitlab Runner v2"
}

resource "digitalocean_project_resources" "gitlab_runnner" {
  project = data.digitalocean_project.gitlab_runner.id
  resources = [
    digitalocean_droplet.gitlab_runner.urn
  ]

  depends_on = [data.digitalocean_project.gitlab_runner, digitalocean_droplet.gitlab_runner]
}
