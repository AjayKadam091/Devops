module "dev-infra" {
  source         = "./infra-app"
  env            = "dev"
  bucket_name    = "infra-app-s3-bucket-001"
  instance_count = 1
  instance_type  = "t3.micro"
  ami_id         = "ami-0157af9aea2eef346"
  hash_key       = "empID"
}

module "prod-infra" {
  source         = "./infra-app"
  env            = "prod"
  bucket_name    = "infra-app-s3-bucket-001"
  instance_count = 2
  instance_type  = "t3.medium"
  ami_id         = "ami-0157af9aea2eef346"
  hash_key       = "empID"
}

module "stage-infra" {
  source         = "./infra-app"
  env            = "stage"
  bucket_name    = "infra-app-s3-bucket-001"
  instance_count = 1
  instance_type  = "t3.small"
  ami_id         = "ami-0157af9aea2eef346"
  hash_key       = "empID"
}