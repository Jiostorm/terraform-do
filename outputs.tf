output "gitlab_runner_group_id" {
  value       = module.gitlab.gitlab_runner_group_id
  description = "Gitlab Runner Group ID"
}

output "digitalocean_droplet_name" {
  value       = module.digitalocean_gitlab_runner.droplet_name
  description = "DigitalOcean Droplet Name"
}

output "digitalocean_droplet_region" {
  value       = module.digitalocean_gitlab_runner.droplet_region
  description = "DigitalOcean Droplet Region"
}

output "digitalocean_droplet_image" {
  value       = module.digitalocean_gitlab_runner.droplet_image
  description = "DigitalOcean Droplet OS Image"
}

output "digitalocean_droplet_ipv4_address" {
  value       = module.digitalocean_gitlab_runner.droplet_ipv4_address
  description = "DigitalOcean Droplet IPv4 Address"
}

output "droplet_price_monthly" {
  value       = module.digitalocean_gitlab_runner.droplet_price_monthly
  description = "DigitalOcean Droplet Monthly Price"
}

output "project_name" {
  value       = module.digitalocean_gitlab_runner.project_name
  description = "DigitalOcean Project Name"
}

# Package and Image Versions
output "docker_version" {
  value       = module.digitalocean_gitlab_runner.docker_version
  description = "DigitalOcean Droplet Docker Version"
}

output "gitlab_runner_version" {
  value       = module.digitalocean_gitlab_runner.gitlab_runner_version
  description = "DigitalOcean Droplet Gitlab Runner Version"
}

output "gitlab_runner_base_image" {
  value       = module.digitalocean_gitlab_runner.gitlab_runner_base_image
  description = "Gitlab Runner Base Image"
}
#
# Gitlab Runner Specs
output "gitlab_runner_concurrency" {
  value       = module.digitalocean_gitlab_runner.gitlab_runner_concurrency
  description = "Gitlab Runner Concurrency Config"
}
