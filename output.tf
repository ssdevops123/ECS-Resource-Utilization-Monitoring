output "ecs_alarm_names" {
  description = "List of ECS CloudWatch alarm names"
  value = [
    for alarm in aws_cloudwatch_metric_alarm.ecs_alarms :
    alarm.alarm_name
  ]
}
output "ecs_alarm_metric_names" {
  description = "List of metrics used by ECS CloudWatch alarms"
  value = [
    for alarm in aws_cloudwatch_metric_alarm.ecs_alarms :
    alarm.metric_name
  ]
} 
 # output the SNS ARN for easy reference
output "alerts_sns_arn" {
  value = aws_sns_topic.alerts.arn
}

#alarm name → metric name mapping
output "ecs_alarm_name_metric_map" {
  description = "Map of alarm name to metric name"
  value = {
    for key, alarm in aws_cloudwatch_metric_alarm.ecs_alarms :
    alarm.alarm_name => alarm.metric_name
  }
}
