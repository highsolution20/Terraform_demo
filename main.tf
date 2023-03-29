provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAS4RY27TJ5QHM4DWS"
  secret_key = "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"
}

resource "aws_instance" "Demo" {
  ami           = "ami-0d758c1134823146a"
  instance_type = "t2.micro"
  key_name = "OreoKey"
  tags = {
    Name = "Demo"
  }
}
