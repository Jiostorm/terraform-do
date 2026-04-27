data "gitlab_group" "cloud" {
  full_path = var.runner_group
}

resource "gitlab_user_runner" "group_runner" {
  runner_type  = "group_type"
  group_id     = data.gitlab_group.cloud.id
  description  = var.runner_description
  access_level = "not_protected"
  locked       = false
  paused       = false
  untagged     = true
  tag_list     = var.runner_tags
}
