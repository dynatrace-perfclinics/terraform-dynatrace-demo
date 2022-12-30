resource "dynatrace_http_monitor" "Lambda_ping" {
  name      = "Lambda ping"
  enabled   = true
  frequency = 1
  locations = [ "GEOLOCATION-DBDE1FDFF560E601" ]
  anomaly_detection {
    loading_time_thresholds {
      enabled = true
    }
    outage_handling {
      global_outage    = true
      # local_outage   = false
      # retry_on_error = false
      global_outage_policy {
        consecutive_runs = 1
      }
    }
  }
  script {
    request {
      description = "Demo lambda ping"
      method      = "GET"
      url         = aws_api_gateway_deployment.apideploy.invoke_url
      configuration {
        accept_any_certificate = true
        follow_redirects       = true
      }
      validation {
        rule {
          type            = "httpStatusesList"
          # pass_if_found = false
          value           = ">=400"
        }
      }
    }
  }
}
