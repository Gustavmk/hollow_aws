output "instance-dns" {
  value = aws_instance.web.public_dns
}

output "instance-publicip" {
  value = aws_instance.web.public_ip
}

output "instance-id" {
  value = aws_instance.web.id
}