resource "dynatrace_slo" "lambda_availability_slo" {
  name              = "Demo Lambda Availability SLO"
  evaluation        = "AGGREGATE"
  filter            =<<-EOT
    type("SERVICE"),entityName("demo-dt-func-${var.env_codename}")
  EOT
  metric_expression = "(100)*(builtin:service.errors.server.successCount:splitBy())/(builtin:service.requestCount.server:splitBy())"
  target            = 99
  timeframe         = "-1h"
  warning           = 99.5
}
