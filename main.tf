# INSTANCE
resource "aws_instance" "web" {
  ami                         = data.aws_ami.aws-linux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.web.id
  vpc_security_group_ids      = [aws_security_group.sg-web.id]
  key_name                    = var.ssh_key_name

  user_data                   = filebase64(var.user_data)
  
  associate_public_ip_address = true
  
 }

