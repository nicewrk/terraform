resource "aws_launch_configuration" "example_launch_config" {
  image_id        = "ami-04370661"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, world" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}
