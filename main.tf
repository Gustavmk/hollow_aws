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

# ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume
resource "aws_ebs_volume" "web_vol_generic_data" {
  availability_zone = aws_instance.web.availability_zone
  size              = 30
  type              = "gp2"
}

# ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment
resource "aws_volume_attachment" "web_generic_data_vol_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.web_vol_generic_data.id
  instance_id = aws_instance.web.id
}

# AWS EBS Device Name REF: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html