provider "aws" {
    region = var.region

}

resource "aws_instance" "ec2" {
    ami = ""
    instance_type = ""
    subnet_id = ""
}

resource "aws_s3_bucket" "s3" {

    region = 

}

resource "aws_vpc" "vpc" {
    

}