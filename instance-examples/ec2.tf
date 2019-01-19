resource "aws_instance" "example" {
  ami                    = "ami-04370661"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, world" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags {
    Name = "terraform-example"
  }
}
