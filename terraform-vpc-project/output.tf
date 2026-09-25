output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "subnet1_id" {
  value = aws_subnet.public_subnet_1.id
}
output "public_ip" {
  value = aws_instance.web_server.public_ip
}

