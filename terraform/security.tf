resource "aws_wafv2_web_acl" "waf" {

  name  = "${var.project_name}-waf"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "wafMetrics"
    sampled_requests_enabled   = true
  }
}