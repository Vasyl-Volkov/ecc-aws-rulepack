resource "aws_cloudwatch_log_group" "this" {
  name = "080_log_group_green"
}

resource "aws_cloudwatch_log_stream" "this" {
  name           = "080_log_stream_green"
  log_group_name = aws_cloudwatch_log_group.this.name
}

resource "aws_cloudwatch_log_metric_filter" "this" {
  name           = "080_CloudTrail_Configuration_Changes"
  pattern        = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
  log_group_name = aws_cloudwatch_log_group.this.name

  metric_transformation {
    name      = "080_CloudTrail_Configuration_Changes"
    namespace = var.namespace
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name                = "080_CloudTrail_Configuration_Changes"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "080_CloudTrail_Configuration_Changes"
  namespace                 = var.namespace
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = ""
  insufficient_data_actions = []
  alarm_actions             = [aws_sns_topic.this.arn]
}
