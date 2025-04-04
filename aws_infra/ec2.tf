#key -Pair for login
resource aws_key_pair my_key{
    key_name = "demo-${var.env}-key-pair"
    public_key = file("YOUR_SSH_KEY_PATH")
tags = {
  Name="${var.env}-infra"
}

}


#VPC and Security group
resource aws_default_vpc default {
}

resource aws_security_group my_security_group {
  name        = "${var.env}-infra_app"
  description = "this will add a TF security group "
  vpc_id      = aws_default_vpc.default.id

}

#inbound rules

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4        = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4        = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
tags = {
  Name="${var.env}-infra"
}


}

#outbound rules
resource "aws_vpc_security_group_egress_rule" "allow_outbound_rules" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
  from_port = 0
  to_port = 0

tags = {
  Name="${var.env}-infra"
}

  
}


# ec2 Instance

  resource "aws_instance" "my_instance" {
    count = var.instance_count
    
      key_name = aws_key_pair.my_key.key_name
      security_groups = [aws_security_group.my_security_group.name]
      instance_type = var.instance_type      
      ami = var.ami
      

      root_block_device {
        volume_size = 10
      volume_type = "gp3"
      }
    
    tags = {
      Name="${var.env}-infra"
    }
  }

  

    
  
  

