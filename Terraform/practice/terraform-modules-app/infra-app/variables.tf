variable "env" {
  description = "this is the environment value"
  type = string
}

variable "bucket_name" {
  description = "this is the bucket name for infra"
   type = string
}

variable "instance_count" {
  description = "this is count value for ec2 instance"
  type = number
}

variable "instance_type" {
  description = "this is instance type for ec2"
  type = string
}
variable "ami_id" {
  description = "this is ami id for ec2"
  type = string
}

variable "hash_key" {
  description = "this is the hash key for dynamodb table"
  type = string
}