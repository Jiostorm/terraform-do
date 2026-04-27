variable "runner_group" {
  type        = string
  description = "Gitlab Runner Group"
}

variable "runner_description" {
  type        = string
  description = "Gitlab Runner Description"
  default     = "Terraform-created Gitlab Runner"
}

variable "runner_tags" {
  type        = list(string)
  description = "Gitlab Runner Tags"
  default     = ["tf-gitlab-runner"]
}
