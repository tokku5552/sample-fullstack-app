resource "aws_iam_role" "rds-role" {
  name               = "${var.environment}-${var.project}-rds-role"
  assume_role_policy = file("${path.module}/policy/rds_role.json")
}