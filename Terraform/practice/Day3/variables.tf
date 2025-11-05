variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-0ecb62995f68bb549"
}

variable "ec2_default_root_storage_size" {
  default = 8
  type = number
}

variable "ec2_root_storage_type" {
  default =  "gp3"
  type = string
}
variable "env" {
  default = "dev"
  type = string
}