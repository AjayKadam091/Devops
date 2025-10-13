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
    

}