#ECS Resource Utilization Monitoring Variables

ecs_services = [
    #service 1 
  {
    cluster_name     = "recupe-dev-clstr-webapi-us-west-2"
    service_name     = "recupe-dev-svc-webapi-us-west-2"
    cpu_threshold    = 80
    memory_threshold = 80
 
  } /* service 2
  {
    cluster_name     = "Test-notfier"
    service_name     = "service2"
    cpu_threshold    = 75
    memory_threshold = 65
     disk_threshold = 80
  } */
]
app_name    = "testing-metric13"
environment = "qa"
aws_region  = "us-west-2"
alert_emails  = ["sowjanyam@nousinfo.com"]


###########

# ECS  Application Log Keyword Based Monitoring Variables
ecs_log_group_name = "/ecs/recupe-dev-task-webapi-us-west-2"
log_patterns = {
  errors        = "ERROR ? error ? Error"
  warnings      = "WARNING ? warning ? Warning"
  failed        = "FAILED ? failed ? Failed"
  healthcheck = "healthcheck"
  elb = "ELB-HealthChecker"
}
/*sample log patterns
log_patterns = {
  errors        = "ERROR"
  warnings      = "WARNING"
  failed        = "FAILED"    // with "FAILED" --> "\"FAILED\""
  timeout       = "TIMEOUT"
  db_error      = "DB_CONNECTION_FAILED"
  healthcheck   = "healthcheck"
  elb           = "ELB-HealthChecker"
} */