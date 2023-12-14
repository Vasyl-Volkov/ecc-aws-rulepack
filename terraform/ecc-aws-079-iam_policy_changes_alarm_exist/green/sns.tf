resource "aws_sns_topic" "this" {
  name = "079-sns-green"
}

resource "aws_sqs_queue" "this" {
  name = "079-sqs-green"
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn = aws_sns_topic.this.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.this.arn
}