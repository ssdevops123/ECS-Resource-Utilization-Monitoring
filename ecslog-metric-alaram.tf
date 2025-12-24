// CloudWatch alarm resources for ECS Log Monitoring

resource "aws_cloudwatch_metric_alarm" "ecs_log_alarms" {
  for_each = var.log_patterns

  alarm_name          = "ecs-${each.key}-alarm"
  alarm_description   = "Triggers when ${each.key} logs detected"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 5
  evaluation_periods  = 1  //3
  period              = 120
  statistic           = "Sum"

  metric_name = "${each.key}-count"
  namespace   = "ECS/LogMonitoring1"

  alarm_actions = [aws_sns_topic.alerts.arn]     # Send mail for ALARM
  ok_actions    = []      

  # No mails for INSUFFICIENT_DATA
  insufficient_data_actions = []            
  treat_missing_data        = "notBreaching"  
}
