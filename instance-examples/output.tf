output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}

output "asg_availability_zones" {
  value = "${aws_autoscaling_group.example_asg.availability_zones}"
}
