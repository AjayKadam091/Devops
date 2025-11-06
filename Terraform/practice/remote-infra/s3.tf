resource "aws_s3_bucket" "remote_state" {   
    bucket = "state-manage-s3-bucket-211"

    tags = {
      Name = "state-manage-s3-bucket-211"
      Environment = "Dev"
    }

}