resource "terraform_data" "do_droplet_gitlab_runner_lifecycle" {
  input = [
    var.droplet_name,
    var.droplet_region,
    var.droplet_image,
    var.droplet_size,
  ]
}

resource "terraform_data" "docker_lifecycle" {
  input = [
    var.docker_version
  ]
}

resource "terraform_data" "gitlab_runner_lifecycle" {
  input = [
    var.gitlab_runner_version,
    var.gitlab_runner_base_image,
    var.gitlab_runner_concurrency
  ]
}
