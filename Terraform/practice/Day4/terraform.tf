terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }

# remote backend provisioning 
#  backend "s3" {
#
#    bucket = "state-manage-s3-bucket-211" 
#    key = "terraform.tfstate"
#    region = "us-east-1"
#    dynamodb_table = "remote-state-table"

#  }

}
