variable "app_name" {
  type = string
}

variable "environment" {
  type = string
}

##################
# ECS Resource Utilization Monitoring Variables


variable "ecs_services" {
  type = list(object({
    cluster_name     = string
    service_name     = string
    cpu_threshold    = number
    memory_threshold = number
   // disk_threshold = optional(number)
  }))
}

variable "metrics" {
  type = map(object({
    metric_name = string
    threshold   = string  # key in ecs_services
  }))
  default = {
    CPU    = { metric_name = "CPUUtilization", threshold = "cpu_threshold" }
    Memory = { metric_name = "MemoryUtilization", threshold = "memory_threshold" }
    Disk   = { metric_name = "DiskSpaceUtilization", threshold = "disk_threshold" }
  }
}

/*
# SNS topic ARN for alarm actions
variable "alarm_sns_arn" {
  description = "SNS topic ARN for ECS alarms"
  type        = string
  default     = ""
} */
# SNS email recipients/subscriptions
variable "alert_emails" {
  type    = list(string)
  default = []
}
variable "aws_region" {
  type    = string
  default = "us-west-2"
}

##################
# ECS Application Log Keyword Based Monitoring Variables


# ECS log groups to monitor errors
variable "ecs_log_group_name" {
  description = "CloudWatch Log Group Name for ECS task"
  type        = string
} 




variable "log_patterns" {
  description = "Map of log keyword → filter pattern"
  type        = map(string)
  default = {
  errors        = "ERROR ? error ? Error"
  warnings      = "WARNING ? warning ? Warning"
  failed        = "FAILED ? failed ? Failed"
    healthcheck = "healthcheck"
    elb = "ELB-HealthChecker"
  }
}
