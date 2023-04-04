provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ansible" {
  ami           = "ami-02f97949d306b597a"
  instance_type = "t2.micro"
  key_name      = "AWSKEY"
#  user_data     = "${file("userdata.sh")}"
  tags = {
    Name = "ansible-server"
  }

  vpc_security_group_ids = [aws_security_group.ansible.id]
  subnet_id              = aws_subnet.ansible.id
}

resource "aws_security_group" "ansible" {
  name_prefix = "ansible-sg-"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ansible-sg"
  }
}

resource "aws_subnet" "ansible" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "ansible-subnet"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ansible-vpc"
  }
}
