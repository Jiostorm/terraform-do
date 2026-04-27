module "gitlab" {
  source = "./modules/gitlab"

  runner_group       = "cloud"
  runner_description = "Terraform-created Gitlab Runner v2"
  runner_tags = [
    "tf-gitlab-runner"
  ]

  providers = {
    gitlab = gitlab.gl_cloud
  }
}

module "digitalocean_gitlab_runner" {
  source = "./modules/digitalocean"

  droplet_name  = "gitlab-runner-v2"
  droplet_image = var.do_droplet_image
  droplet_size  = var.do_droplet_size

  docker_version           = var.docker_version
  gitlab_runner_version    = var.gitlab_runner_version
  gitlab_base_url          = var.gitlab_base_url
  gitlab_runner_auth_token = module.gitlab.gitlab_runner_auth_token

  gitlab_runner_base_image  = var.gitlab_runner_base_image
  gitlab_runner_concurrency = var.gitlab_runner_concurrency

  providers = {
    digitalocean = digitalocean.gitlab_runner
  }
}
