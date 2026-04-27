output "gitlab_runner_group_id" {
  value       = gitlab_user_runner.group_runner.group_id
  description = "Gitlab Runner Group ID"
}

output "gitlab_runner_auth_token" {
  value       = gitlab_user_runner.group_runner.token
  description = "Gitlab Runner Auth Token"
  sensitive   = true
}
