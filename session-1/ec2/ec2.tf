resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"  #devops-practice
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id] # [] means list

  tags = {
    Name = "HelloTerraform"
  }
}

resource "aws_security_group" "roboshop-all" { #this is terraform name for terraform reference only
  name = var.sg-name #this is for aws name
  description = var.sg-description
  #vpc_id = aws_vpc.main.id

  ingress {
      description = "Allow all ports"
      from_port = var.inbound-from-port #o means all ports
      to_port = 0
      protocol = "tcp"
      cidr_blocks = var.cidr_blocks
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name ="roboshop-all-aws"
  }
}