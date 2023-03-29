terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"             # "ami-0a634ae95e11c6f91"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "newServerKey"
  vpc_security_group_ids      = ["sg-0362a69872d0dc3f7"]

  tags = {
    Name = "highsolutionTerraform"
  }
}
