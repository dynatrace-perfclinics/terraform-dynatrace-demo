resource "dynatrace_dashboard" "slo_dashboard" {
  dashboard_metadata {
    name     = "SLO Main Dashboard"
    owner    = "adrian.gonciarz@gmail.com"
    preset = true
    shared = true
  }
  tile {
    name       = "My SLOs"
    configured = true
    tile_type  = "HEADER"
    bounds {
      height = 38
      left   = 0
      top    = 0
      width  = 912
    }
  }
  tile {
    name              = "Service-level objective"
    assigned_entities = [ dynatrace_slo.lambda_availability_slo.id ]
    configured        = true
    metric            = "METRICS=true;LEGEND=true;PROBLEMS=true;decimals=10;customTitle=Demo Lambda Availability SLO;"
    tile_type         = "SLO"
    bounds {
      height = 152
      left   = 0
      top    = 38
      width  = 494
    }
    filter {
      timeframe = "-1h"
    }
  }
}
resource "dynatrace_dashboard_sharing" "slo_dashboard" {
  enabled    = true
  dashboard_id = dynatrace_dashboard.slo_dashboard.id
  # preset     = false
  permissions {
    permission {
      type  = "ALL"
      level = "VIEW"
    }
  }
}
