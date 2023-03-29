provider "aws" {
  region = "us-west-2"
  access_key = "AKIAS4RY27TJ5QHM4DWS"
  secret_key = "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"
}
resource "aws_instance" "tfvm" {
  ami = "ami-0735c191cf914754d"
  instance_type = "t2.micro"
  key_name = "newServerKey"
  vpc_security_group_ids = [ aws_security_group.websg.id ]
  user_data = <<-EOF
                #!/bin/bash
                echo "High Solution Terraform " > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    tags = {
      Name = "WEB-Terra"
    }
}
resource "aws_security_group" "websg" {
  name = "web-sg01"
  ingress {
    protocol = "tcp"
    from_port = 8080
    to_port = 8080
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
output "instance_ips" {
  value = aws_instance.tfvm.public_ip
}
