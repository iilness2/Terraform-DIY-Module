variable "ecr_name" {
  default = "ecrepo"
}

variable "ecs_cluster_name" {}

variable "ecs_iam_instance_profile_id" {}

variable "security_groups" {default = [], type = "list"}

variable "availability_zones" {default = [], type = "list"}

variable "vpc_zone_identifier" {default = [], type = "list"}

variable "image_id" {}

variable "instance_type" {
  default = "t2.medium"
}
