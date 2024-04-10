resource "aws_db_instance" "default" {
    identifier           = "database-2023"
    allocated_storage    = 20
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "8.0.35"
    instance_class       = "db.t3.micro"
    username             = "admin"
    password             = "password"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot  = true
    availability_zone    = "us-east-1a"
    tags = {
        Name = "metadata"
    }
}