# Primary RDS Instance
resource "aws_db_instance" "primary" {
  identifier              = "my-primary-db"
  engine                  = "mysql"
  engine_version          = "06-08-1992-devtest-mainbranch"
  instance_class          = "t2.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  username                = "admin"
  password                = "Admin*12345" # Change in real use, or use AWS Secrets Manager
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = ["sg-0134c13728838f1c3"] # Replace with your SG ID
  skip_final_snapshot     = true
  publicly_accessible     = true
  backup_retention_period = 7
}
