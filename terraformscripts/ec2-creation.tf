
provider "aws"{
region = "eu-north-1"
}

resource "aws_instance" "AWSServer"{
ami = "ami-0c147c2e2b026f094"
instance_type = "t3.micro"
key_name = "redhatdevops"
security_groups = ["launch-wizard-9"]
tags = {
Name = "tomcatsservers"
}
}



