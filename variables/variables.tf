# terraform will search the varibles values as per below flow
# First preference will be command line
# Second preference will be -var-file="" which we need to run with terraform plan and provide file name
# Third preference will be terraform.tfvars
# Last preference will be Environment variables
variable "ami_id" {
  type = string
  default = "ami-0f3c7d07486cad139"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "tags" {
  type = map 
  default = {
    Name = "HelloTerraform"
    Project = "Roboshop"
    Environment = "Dev"
    component = "Web"
    Terraform = true
  }
}

variable "sg-name" {
  type = string
  default = "roboshop-all-aws"
}

variable "sg-description" {
  type = string
  default = "Allow TLS inbound traffic"
}

variable "inbound-from-port" {
  type = number
  default = 0
}

variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}