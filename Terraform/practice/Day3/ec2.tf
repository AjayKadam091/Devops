#keypair

resource "aws_key_pair" "mykey" {
  key_name = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

#vpc & security group

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "mysg" {
    name = "automate-sg"
    description = "this will add an tf generated security group"
    vpc_id = aws_default_vpc.default.id #interpolation

    tags = {
      "Name" = "automate-sg"
    }

    #inbound rule - ingress
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "SSH open"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "HTTP open"
    }

    
    #outbound rule - egress

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "all access open outbound"
    }
}


#ec2 instance


resource "aws_instance" "my_instance" {
 # count = 2 # meta argument
# for_each = tomap({                                                #use each.key and each.value to access these
#    My-terra-instance-micro = "t3.micro"
#    My-terra-instance-medium = "t3.medium"
# })
  depends_on = [ aws_security_group.mysg, aws_key_pair.mykey]
  key_name = aws_key_pair.mykey.key_name
  security_groups = [ aws_security_group.mysg.name ]
  instance_type = var.instance_type
#  instance_type = each.value
  ami = var.ami_id # ubuntu
  root_block_device {
    volume_size = var.env == "prod" ? 20 : var.ec2_default_root_storage_size # ternary operator
    volume_type = var.ec2_root_storage_type
  }
    user_data = file("install_nginx.sh")
  tags = {
    "Name" = "My-terra-instance"
#    "Name" = each.key
  }
}

