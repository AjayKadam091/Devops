provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dummy" {
    ami = var.amiID
    instance_type = var.instance_type
}

resource "aws_s3_bucket" "bit_bucket_v45" {
    

}