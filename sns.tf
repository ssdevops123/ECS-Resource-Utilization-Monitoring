
resource "aws_sns_topic" "alerts" {
  name = "${var.app_name}-${var.environment}-alerts"
}


resource "aws_sns_topic_subscription" "email_subs" {
  for_each = toset(var.alert_emails)

  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = each.value
}
