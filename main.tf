// CloudWatch alarm resources for ECS Service Resource Utilization Monitoring


resource "aws_cloudwatch_metric_alarm" "ecs_alarms" {
  for_each = local.ecs_alarms_map

  alarm_name          = each.key
  namespace           = "AWS/ECS"
  metric_name         = each.value.metric_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  period              = 120
  statistic           = "Average"
  threshold           = each.value.threshold

 alarm_actions = [aws_sns_topic.alerts.arn]
 ok_actions = [aws_sns_topic.alerts.arn]

  insufficient_data_actions = null

   treat_missing_data = "notBreaching"  

  # Required for ECS to monitor the correct service
  dimensions = {
    ClusterName = each.value.cluster_name
    ServiceName = each.value.service_name
  }
}

