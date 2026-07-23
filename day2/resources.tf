data "aws_vpc" "default" { 
  default = true
}

resource "aws_security_group" "default" {
  name        = var.sg_name
  description = "Allow SSH and HTTP access"
  vpc_id      = ["vpc-0361625917c790ba5"]

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = my-security-group
  }
}

resource "aws_instance" "ec2" {
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = t3.micro
  key_name               = mykey
  vpc_security_group_ids = ["sg-0911bc18773c76c42"]
  user_data              = file("../user data.sh")

  }  
