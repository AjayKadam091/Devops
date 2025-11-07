#keypair

resource "aws_key_pair" "mykey_new" {
  key_name = "${var.env}-infra-terra-key-ec2"
  public_key = file("terra-key-ec2.pub")

  tags = {
    Environment = var.env
  }
}

#vpc & security group

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "mysg" {
    name = "${var.env}-infra-app-sg"
    description = "this will add an tf generated security group"
    vpc_id = aws_default_vpc.default.id #interpolation

    tags = {
      Name = "${var.env}-infra-app-sg"
      Environment = var.env
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
   count = var.instance_count

  depends_on = [ aws_security_group.mysg, aws_key_pair.mykey_new]
  key_name = aws_key_pair.mykey_new.key_name
  security_groups = [ aws_security_group.mysg.name ]
  instance_type = var.instance_type
  ami = var.ami_id # ubuntu
  root_block_device {
    volume_size = var.env == "prod" ? 20 : 8 # ternary operator
    volume_type = "gp3"
  }
  
  tags = {
    Name = "${var.env}-infra-app-instance"
    Environment = var.env
  }
}

