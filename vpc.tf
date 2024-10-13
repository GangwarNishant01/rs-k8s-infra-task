provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}


resource "aws_vpc" "k8s_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "k8s-vpc"
  }
}

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                 = aws_vpc.k8s_vpc.id
  cidr_block             = element(var.public_subnet_cidrs, count.index)
  availability_zone      = element(data.aws_availability_zones.available.names, count.index)

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count              = 2
  vpc_id            = aws_vpc.k8s_vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

