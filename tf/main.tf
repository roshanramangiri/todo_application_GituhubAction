# #EC2 and its security group
# resource "aws_security_group" "ec2-sg" {
#   name = "rrg-sg"
#   description = " ec2 security group"
# }

# resource "aws_security_group_rule" "ec2-sg-http" {
#   type = "ingress"
#   security_group_id = aws_security_group.ec2-sg.id
#   from_port = 80
#   to_port = 80
#   protocol = "TCP"
#   cidr_blocks = ["0.0.0.0/0"]
# }
# resource "aws_security_group_rule" "ec2-sg-https" {
#   type = "ingress"
#   security_group_id = aws_security_group.ec2-sg.id
#   from_port = 443
#   to_port = 443
#   protocol = "TCP"
#   cidr_blocks = ["0.0.0.0/0"]
# }
# resource "aws_security_group_rule" "ec2-sg-ssh" {
#   type = "ingress"
#   security_group_id = aws_security_group.ec2-sg.id
#   from_port = 22
#   to_port = 22
#   protocol = "TCP"
#   cidr_blocks = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "ec2-sg-egress" {
#     type = "egress"
#     security_group_id = aws_security_group.ec2-sg.id
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"] 
# }

#Creating EC2 instance
resource "aws_instance" "LAMP_server" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
  vpc_security_group_ids = ["sg-06347fcf925ff7c0d"]
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }
  user_data = "${file("first.sh")}"
  tags = merge(
    var.tags, local.tags
  )
}
terraform {
  backend "s3" {
    bucket         = "roshanramangiri"
    key            = "tf/terraform.tfstate"
    region         = "us-east-1"
  }
}
