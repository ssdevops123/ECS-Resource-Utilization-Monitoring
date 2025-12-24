// CloudWatch Metric Filter resources for ECS Log Monitoring

resource "aws_cloudwatch_log_metric_filter" "ecs_log_filters" {
  for_each = var.log_patterns

  name           = "${each.key}-metric-filter"
  log_group_name = var.ecs_log_group_name

  pattern = each.value

  metric_transformation {
    name      = "${each.key}-count"
    namespace = "ECS/LogMonitoring1"
    value     = "1"
  }
}
