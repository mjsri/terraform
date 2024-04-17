#NOtes
#By using count.index in condition we can deploy number of ec2 and route 53 by combining it to instance names
#we can use length for counting of resources and we can create resources with names
#By passing condition we can create different size of resources 
resource "aws_instance" "web" {
  #count = 11
  count = length(var.instance_names)
  ami = var.ami_id
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_route53_record" "www" {
  #count = 11
  count = length(var.instance_names)
  zone_id = var.zone_id
  name = "${var.instance_names[count.index]}.${var.domain_name}" #mixing variable with text is interpolation
  type = "A"
  ttl = 1
  records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}