resource "aws_autoscaling_group" "example_asg" {
  launch_configuration = "${aws_launch_configuration.example_launch_config.id}"
  availability_zones   = ["${data.aws_availability_zones.all.names}"]

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
