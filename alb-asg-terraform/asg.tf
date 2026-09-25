data "aws_ami" "amazonlinux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
resource "aws_launch_template" "web" {

  name_prefix   = "web-"

  image_id      = data.aws_ami.amazonlinux.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = base64encode(<<EOF
#!/bin/bash

dnf install nginx -y

systemctl start nginx
systemctl enable nginx

echo "<h1>Hello from $(hostname)</h1>" > /usr/share/nginx/html/index.html

EOF
)
}
resource "aws_autoscaling_group" "web" {

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.public1.id,
    aws_subnet.public2.id
  ]

  target_group_arns = [
    aws_lb_target_group.tg.arn
  ]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  health_check_type = "ELB"
}
