


terraform{
    required_providers{
         aws={
          
          source= "hashicorp/aws"
          version= "5.11.0"
}
}
}


provider aws{
      region="us-east-1"
}



***************

resource "aws_vpc" "my_vpc"{
 cidr_block = "10.0.0.0/16"
 enable_dns_hostnames= true
 enable_dns_support=true
}

tags=
{
Name=myvpc
}

resource aws_subnet pb_sn{
 vpc_id=aws_vpc.my_vpc.id
 cidr_block= "10.0.1.0/24"
 match_public_ip_on_launch=true
 availability_zone= "us-east-1a"
 
tags={
  Name="pb_sn"
}

}

resource "aws_security_group" "sg"{
   vpc_id=aws_vpc.my_vpc.id
   name="sg"

 ingress{
   from_port =22
   to_port=22
   protocol="tcp"
   cidr_value=["0.0.0.0/0"]
   }

egress{
  from_port= 0
  to_port=0
  protocol="-1"
  cidr_value=["0.0.0.0/0"]
}
}

   
