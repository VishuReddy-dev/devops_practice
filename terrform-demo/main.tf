provider "aws"{
	region = "ap-south-2"
}
resource "aws_instance" "myserver_tf"{
	ami  = "ami-0f84e72ee2b9c3a09"
	instance_type = var.instance_type
	tags={
		Name=var.instance_name
	}
}
