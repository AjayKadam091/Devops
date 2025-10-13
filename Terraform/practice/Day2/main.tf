provider "aws" {
    region = var.region

}

resource "aws_instance" "ec2" {
    ami = ""
    instance_type = ""
    subnet_id = ""
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.bucket
    region = var.region
    acl = "private"
    tags = {
      "name" = "app-bucket-231"
      "Environment" = "Dev"
    }

}

resource "aws_vpc" "vpc" {
    

}