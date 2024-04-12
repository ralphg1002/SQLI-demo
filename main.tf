resource "aws_db_instance" "mysql_rds" {
    identifier           = "mysql-db"
    allocated_storage    = 20
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "8.0.35"
    instance_class       = "db.t3.micro"
    db_name              = "metadata"
    username             = "admin"
    password             = "password"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot  = true
    availability_zone    = "us-east-1a"
    publicly_accessible  = true
}

resource "aws_security_group" "ec2_sg" {
    name        = "ec2_sg"
    description = "Allow MySQL inbound traffic"
    
    # Set to open for demo, can change to your IP
    ingress = [
        {
            description = "HTTP"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        },
        {
            description = "ssh"
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}

resource "aws_instance" "example_instance" {
    tags = {
      Name = "phpDemoInstance"
    }
    ami           = "ami-080e1f13689e07408"
    instance_type = "t2.micro"
    key_name      = "demophp" #existing keypair
    vpc_security_group_ids = ["ec2_sg"]
    iam_instance_profile = "baseline-role-default-instance-role-us-east-1" #existing IAM role
}