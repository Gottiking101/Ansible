provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ansible_instance_1" {
  ami           = "ami-0a695f0d95cefc163"
  instance_type = "t2.micro"
  count         = 3
  
  tags = {
    Name = "ansible-instance-${count.index + 1}"
  }
}

