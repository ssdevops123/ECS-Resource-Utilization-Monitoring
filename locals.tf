// Define local variables for metrics and ECS alarms for Resource Utilization Monitoring

locals {
  # Metrics to create alarms for
  metrics = {
    CPU = {
      metric_name = "CPUUtilization"
      threshold   = "cpu_threshold"
    }
    Memory = {
      metric_name = "MemoryUtilization"
      threshold   = "memory_threshold"
    } /*
     Disk = {
      metric_name = "DiskUtilization"
      threshold   = "disk_threshold"
    } */

  }

  # Flattened map of all ECS alarms
  ecs_alarms_map = merge([
    for svc in var.ecs_services : {
      for metric_key, metric_cfg in local.metrics :
      "${var.app_name}-${var.environment}-${svc.cluster_name}-${svc.service_name}-${metric_key}" => {
        cluster_name = svc.cluster_name
        service_name = svc.service_name
        metric_name  = metric_cfg.metric_name
        threshold    = svc[metric_cfg.threshold]
      }
    }
  ]...)
}
