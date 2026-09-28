provider "aws" {
	region="ap-south-2"
}
resource "aws_instance" "main"{
    ami                                  = "ami-0d810b4169227c0ca"
    availability_zone                    = "ap-south-2a"
    instance_type                        = "t3.micro"
    subnet_id                            = "subnet-0f1ccd8ac99be88f8"
    tags                                 = {
        "Name" = "terraform_import_lab"
    }
   vpc_security_group_ids               = [
        "sg-088ef7ce632978a4a",
    ]
}
