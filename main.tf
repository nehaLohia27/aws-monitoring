provider "aws" {
  region = var.sqs_region
}

resource "aws_sqs_queue" "demo_queue" {
  name                      = var.queue_name
}

resource "aws_cloudwatch_metric_alarm" "queue_utilization_alarm" {
  provider = aws.sns
  alarm_name          = "QueueUtilizationAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = "300"  # 5 minutes
  statistic           = "Average"
  threshold           = var.threshold  # Default threshold, can be overridden

  dimensions = {
    QueueName = aws_sqs_queue.demo_queue.name
  }

  alarm_description = "Alarm for SQS Queue Utilization"

  alarm_actions = [
    aws_sns_topic.demo_topic.arn
  ]
}

provider "aws" {
  alias  = "sns"
  region = var.sqs_topic_region
}

resource "aws_sns_topic" "demo_topic" {
  provider = aws.sns
  name     = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "team1_subscription" {
  provider = aws.sns
  topic_arn = aws_sns_topic.demo_topic.arn
  protocol  = "email"
  endpoint  = var.team1_email
}

resource "aws_sns_topic_subscription" "team2_subscription" {
  provider = aws.sns
  topic_arn = aws_sns_topic.demo_topic.arn
  protocol  = "email"
  endpoint  = var.team2_email
}

