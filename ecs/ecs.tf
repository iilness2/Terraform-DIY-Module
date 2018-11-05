resource "aws_launch_configuration" "ecs-launch-config" {
  iam_instance_profile = "${var.ecs_iam_instance_profile_id}"

  security_groups =["${var.security_groups}",]


  lifecycle {
    create_before_destroy = true
  }
  associate_public_ip_address = "true"
  user_data = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config
                                  EOF
  image_id      = "${var.image_id}"
  instance_type = "${var.instance_type}"
}

resource "aws_autoscaling_group" "ecs-autoscaling" {
  launch_configuration = "${aws_launch_configuration.ecs-launch-config.name}"

  vpc_zone_identifier = ["${var.vpc_zone_identifier}"]

  lifecycle {
    create_before_destroy = true
  }

  min_size = 1
  max_size = 1
}


resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.ecs_cluster_name}"
}

