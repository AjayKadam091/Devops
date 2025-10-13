
variable "region" {
    default = "us-east-1"

}

variable "bucket" {
  description = "unique name for a bucket"
}

variable "amiID" {
  description = "value of ami id for instance"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
