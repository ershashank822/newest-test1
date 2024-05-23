provider "aws" {
    region = "us-east-1"
  
}

resource "ec2_instance" "prodserver" {
    ami = "asnaj11232"
    instance_type = "t2.micro"
     tags = {
    Name = "prod-serdnd"
  }
}

resource "aws_lb" "xyz" {
  name               = "prod-alb"
  load_balancer_type = "application"
  
  subnet_mapping {
    subnet_id = "subnet-0123456789abcdef0"  # Example Subnet ID, replace with a valid one
    private_ip_address = "10.23.12.221"
  }

resource "aws_lb_target_group" "prod_tg" {
  name     = "prod-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0123456789abcdef0" 
}

resource "aws_lb_target_group_attachment" "prod_tg_attachment" {
  target_group_arn = aws_lb_target_group.prod_tg.arn
  target_id        = aws_instance.prodserver.id
  port             = 80
}

resource "aws_vpc_main" "namdhjde" {
    cidr_block = 10.45.45.443/16


  
}