resource "aws_db_instance" "mysql_rds" { #base_db
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

    provisioner "local-exec" {
    command = <<-EOT
      sleep 600 # Wait for RDS instance to be available
      mysql -h ${self.endpoint} -u admin -p${self.password} <<MYSQL_SCRIPT
      CREATE DATABASE IF NOT EXISTS exampledb;
      USE exampledb;
      CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), email VARCHAR(50));
      INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
      INSERT INTO users (name, email) VALUES ('Jane Doe', 'jane.doe@example.com');
      MYSQL_SCRIPT
    EOT
  }
}
