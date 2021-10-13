
# VPC
resource "aws_vpc" "vpc-gmkgo" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = "true"

}

# SUBNET
resource "aws_subnet" "web" {
  cidr_block = var.snet_web_cidr
  vpc_id = aws_vpc.vpc-gmkgo.id
  map_public_ip_on_launch = "true"
  availability_zone = data.aws_availability_zones.available.names[1]
}
# INTERNET_GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-gmkgo.id
}

# ROUTE_TABLE
resource "aws_route_table" "rt-web" {
  vpc_id = aws_vpc.vpc-gmkgo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Route Table Association
resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.vpc-gmkgo.id
  route_table_id = aws_route_table.rt-web.id

  depends_on = [
    aws_route_table.rt-web,
    aws_vpc.vpc-gmkgo
  ]

}

# EC2 Security Grup
resource "aws_security_group" "sg-web" {
  name = "sg_web"
  vpc_id = aws_vpc.vpc-gmkgo.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
