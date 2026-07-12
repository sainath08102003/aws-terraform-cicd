resource "aws_vpc" "mainvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-vpc-main"
  }
}

resource "aws_subnet" "publicsubnet" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-subnet"
  }
}

resource "aws_internet_gateway" "maingateway" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "terraform-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.maingateway.id
  }

  tags = {
    Name = "terraform-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.public.id
}

