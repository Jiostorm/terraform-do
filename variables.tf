# Gitlab
variable "gitlab_base_url" {
  type        = string
  description = "Gitlab Instance Base URL"
  default     = "https://gitlab.com"
}

variable "gitlab_token" {
  type        = string
  description = "Gitlab-generated Access Token"
  sensitive   = true
}

# DigitalOcean
variable "do_token" {
  type        = string
  description = "DigitalOcean Access Token"
  sensitive   = true
}

variable "do_droplet_image" {
  type        = string
  description = "DigitalOcean Droplet OS Image"
  default     = "debian-12-x64"
}

variable "do_droplet_size" {
  type        = string
  description = "DigitalOcean Droplet Size"
  default     = "s-1vcpu-1gb"
}

# Package and Image Versions
variable "docker_version" {
  type        = string
  description = "DigitalOcean Droplet Docker Version"
}

variable "gitlab_runner_version" {
  type        = string
  description = "DigitalOcean Droplet Gitlab Runner Version"
}

variable "gitlab_runner_base_image" {
  type        = string
  description = "Gitlab Runner Base Image"
  default     = "alpine:3.23.3"
}

# Gitlab Runner Specs
variable "gitlab_runner_concurrency" {
  type        = number
  description = "Gitlab Runner Concurrency Config"
}
