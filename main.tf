provider "aws" {
  access_key = "AKIAS4RY27TJ3N4MRIBL"
  secret_key = "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"
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
