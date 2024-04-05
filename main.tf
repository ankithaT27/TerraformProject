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



resource "aws_vpc" "myvpc"{
 cidr_block= "10.0.0.0/16"                                                            

}


resource "aws_subnet" "sub1"{
 vpc_id=aws_vpc.mypvc.id
 cidr_block= "10.0.0.0/24"
 availability_zone= "us-east-1a"
 map_public_ip_on_launch= yes

}



resource "aws_subnet" "sub2"{
 vpc_id=aws_vpc.mypvc.id
 cidr_block= "10.0.1.0/24"
 availability_zone= "us-east-1b"
 map_public_ip_on_launch= yes

}
