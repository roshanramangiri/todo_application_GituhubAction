output "ec2_ip" {
  value = aws_instance.LAMP_server.public_ip
}