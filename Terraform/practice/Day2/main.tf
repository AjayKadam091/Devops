provider "aws" {
    region = var.region

}

resource "aws_instance" "ec2" {
    ami = var.amiID
    instance_type = var.instance_type
    
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.bucket
    region = var.region
    tags = {
      "name" = "app-bucket-231"
      "Environment" = "Dev"
    }

}

resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr

    tags = {
      "name" = "my-vpc"
    }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "name" = "my-vpc-igw"
  }
}


resource "aws_subnet" "public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "name" = "my-public_subnet"
  }


}
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    "name" = "my-private-subnet"
  }
}

resource "aws_route_table" "public_tr" {
  vpc_id = aws_vpc.vpc.id

  route   {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  } 

  tags = {
    "name" = "publict_rt"
  }

}

resource "aws_route_table_association" "public_assoc" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public_tr.id
}