provider "aws"{
	region="ap-south-2"
}
data "aws_ami" "amazon_linux"{
	most_recent=true
	owners=["amazon"]
	filter{
		name="name"
		values=["al2023-ami-*"]
	}
}
resource "aws_instance" "web"{
	for_each=toset([
    "app-server",
    "db-server",
    "cache-server"
  ])
  ami=data.aws_ami.amazon_linux.id
	instance_type="t3.micro"
	tags={
		Name=each.value
	}
}
