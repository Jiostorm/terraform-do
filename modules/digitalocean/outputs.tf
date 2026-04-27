output "droplet_name" {
  value       = digitalocean_droplet.gitlab_runner.name
  description = "DigitalOcean Droplet Name"
}

output "droplet_region" {
  value       = digitalocean_droplet.gitlab_runner.region
  description = "DigitalOcean Droplet Region"
}

output "droplet_image" {
  value       = digitalocean_droplet.gitlab_runner.image
  description = "DigitalOcean Droplet OS Image"
}

output "droplet_ipv4_address" {
  value       = digitalocean_droplet.gitlab_runner.ipv4_address
  description = "DigitalOcean Droplet IPv4 Address"
}

output "droplet_price_monthly" {
  value       = "${"$"}${digitalocean_droplet.gitlab_runner.price_monthly}"
  description = "DigitalOcean Droplet Monthly Price"
}

output "project_name" {
  value       = data.digitalocean_project.gitlab_runner.name
  description = "DigitalOcean Project Name"
}

# Package and Image Versions
output "docker_version" {
  value       = var.docker_version
  description = "DigitalOcean Droplet Docker Version"
}

output "gitlab_runner_version" {
  value       = var.gitlab_runner_version
  description = "DigitalOcean Droplet Gitlab Runner Version"
}

output "gitlab_runner_base_image" {
  value       = var.gitlab_runner_base_image
  description = "Gitlab Runner Base Image"
}

# Gitlab Runner Specs
output "gitlab_runner_concurrency" {
  value       = var.gitlab_runner_concurrency
  description = "Gitlab Runner Concurrency Config"
}
