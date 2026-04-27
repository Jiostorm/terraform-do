variable "droplet_name" {
  type        = string
  description = "DigitalOcean Droplet Name"
  default     = "gitlab-runner-v2"
}

variable "droplet_region" {
  type        = string
  description = "DigitalOcean Droplet Region"
  default     = "sgp1"
}

variable "droplet_image" {
  type        = string
  description = "DigitalOcean Droplet OS Image"
  default     = "debian-12-x64"
}

variable "droplet_size" {
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

# Gitlab Provider Specs
variable "gitlab_base_url" {
  type        = string
  description = "Gitlab Instance Base URL"
}

variable "gitlab_runner_auth_token" {
  type        = string
  description = "Gitlab Runner Auth Token"
}

# Gitlab Runner Specs
variable "gitlab_runner_concurrency" {
  type        = number
  description = "Gitlab Runner Concurrency Config"
  default     = 1
}
