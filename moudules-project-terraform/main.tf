provider "aws" {
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
module "ec2"{
	source="./modules/ec2"
	ami_id=data.aws_ami.amazon_linux.id
	instance_type="t3.micro"
	instance_name="web-server"
}
terraform{
  backend s3{
    bucket="vishwanath-terraform-state-bucket-7793"
    key="dev/terraform.tfstate"
    region="ap-south-2"
    dynamodb_table="terraform-locks"
  }

}
