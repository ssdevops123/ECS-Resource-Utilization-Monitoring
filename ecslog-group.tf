// CloudWatch Log Group for ECS Application Logs

resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.app_name}/${var.environment}"
  retention_in_days = 30
}