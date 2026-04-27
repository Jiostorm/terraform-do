resource "terraform_data" "copy_installers" {
  connection {
    type        = "ssh"
    user        = "root"
    host        = digitalocean_droplet.gitlab_runner.ipv4_address
    private_key = tls_private_key.gitlab_shared.private_key_openssh
    timeout     = "2m"
  }

  provisioner "file" {
    source      = "./scripts/install-docker.sh"
    destination = "/tmp/install-docker"
  }

  provisioner "file" {
    source      = "./scripts/install-gitlab-runner.sh"
    destination = "/tmp/install-gitlab-runner"
  }

  lifecycle {
    replace_triggered_by = [digitalocean_droplet.gitlab_runner]
  }
}

resource "time_sleep" "post_copy_installers" {
  depends_on = [terraform_data.copy_installers]

  create_duration = "1m"
}

resource "terraform_data" "install_docker" {
  depends_on = [time_sleep.post_copy_installers]

  connection {
    type        = "ssh"
    user        = "root"
    host        = digitalocean_droplet.gitlab_runner.ipv4_address
    private_key = tls_private_key.gitlab_shared.private_key_openssh
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      <<-HERE
        chmod +x /tmp/install-docker && \
          /tmp/install-docker ${var.docker_version}
      HERE
    ]
  }

  lifecycle {
    replace_triggered_by = [terraform_data.copy_installers, terraform_data.docker_lifecycle]
  }
}

resource "time_sleep" "post_install_docker" {
  depends_on = [terraform_data.install_docker]

  create_duration = "30s"
}

resource "terraform_data" "install_and_register_gitlab_runner" {
  depends_on = [time_sleep.post_install_docker]

  connection {
    type        = "ssh"
    user        = "root"
    host        = digitalocean_droplet.gitlab_runner.ipv4_address
    private_key = tls_private_key.gitlab_shared.private_key_openssh
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      <<-HERE
        chmod +x /tmp/install-gitlab-runner && \
          /tmp/install-gitlab-runner ${var.gitlab_runner_version}
      HERE
    ]
  }

  provisioner "remote-exec" {
    inline = [
      <<-HERE
        gitlab-runner register \
          --non-interactive \
          --url "${var.gitlab_base_url}" \
          --token "${var.gitlab_runner_auth_token}" \
          --executor "docker" \
          --docker-image "${var.gitlab_runner_base_image}" \
          --description "Terraform-created Gitlab Runner [${digitalocean_droplet.gitlab_runner.id}]" \
          --docker-volumes "/cache" \
          --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
          --docker-allowed-pull-policies "if-not-present" \
          --docker-allowed-pull-policies "always"
      HERE
    ]
  }

  provisioner "remote-exec" {
    inline = [
      <<-HERE
        sed -i -E 's|concurrent = [0-9]+|concurrent = ${var.gitlab_runner_concurrency}|g' /etc/gitlab-runner/config.toml
      HERE
    ]
  }

  lifecycle {
    replace_triggered_by = [terraform_data.install_docker, terraform_data.gitlab_runner_lifecycle]
  }
}
