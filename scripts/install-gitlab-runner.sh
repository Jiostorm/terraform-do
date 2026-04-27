#!/usr/bin/env bash

# Add official Gitlab repository
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

# Update GPG keys
curl -fsSL "https://packages.gitlab.com/runner/gitlab-runner/gpgkey" | gpg --dearmor >/usr/share/keyrings/runner_gitlab-runner-archive-keyring.gpg

GITLAB_RUNNER_VERSION=$1
# Install Gitlab Runner
apt -y install gitlab-runner="$GITLAB_RUNNER_VERSION" gitlab-runner-helper-images="$GITLAB_RUNNER_VERSION"
