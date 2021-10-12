output "instance-dns" {
  value = aws_instance.web.public_dns
}

output "instance-publicip" {
  value = aws_instance.web.public_ip
}

output "instance-id" {
  value = aws_instance.web.id
}

output "SSH_Connection" {
     value = format("ssh connection to instance ${aws_instance.web.ami} ==> sudo ssh -i web_Tf.pem ubuntu@%s",aws_instance.web.public_ip)
}