
provider "aws"{
region = "eu-north-1"
}

resource "aws_instance" "AWSServer"{
ami = "ami-0da59f1af71ea4ad2"
instance_type = "t3.micro"
key_name = "redhatdevops"
security_groups = ["launch-wizard-9"]
tags = {
Name = "tomcatsservers"
}
}



