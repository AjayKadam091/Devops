provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "EC2_instances" {
    ami = ""
    instance_type = ""
    subnet_id = ""
    
}

data "aws_ami" "amiID" {
    most_recent = true
}