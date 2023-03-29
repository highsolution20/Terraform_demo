provider "aws" {
  shared_credentials_file = "/Users/briti/.aws/credentials"
  region     = "ap-south-1"
}

resource "aws_instance" "Demo" {
  ami           = "ami-0d758c1134823146a"
  instance_type = "t2.micro"
  key_name = "OreoKey"
  tags = {
    Name = "Demo"
  }
}
