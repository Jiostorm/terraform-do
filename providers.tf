provider "gitlab" {
  base_url = var.gitlab_base_url
  token    = var.gitlab_token

  alias = "gl_cloud"
}

provider "digitalocean" {
  token = var.do_token

  alias = "gitlab_runner"
}
