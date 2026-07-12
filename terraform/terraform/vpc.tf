resource "aws_vpc" "1vpc" {
    cidr_block = var.vpc_cidr
    enable_dns-support = true
    enable_dns_hostname = true

    tags = {
        Name = "terraform-vpc_cidr
    }
}

resource "aws_subnet" "1subnet" {
    vpc_id = aws_vpc.1vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = "${var.aws_region}a"
    map_public_ip_on_launch = true

    tags = {
        Name = "terraform-subnet"
    }
}