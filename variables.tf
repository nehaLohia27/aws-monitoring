variable "sqs_region" {
  description = "The AWS region where the SQS queue will be created."
  default     = "us-west-2"  # Update with the desired region for SQS
}

variable "sqs_topic_region" {
  description = "The AWS region where the SNS topic will be created."
  default     = "us-east-1"  # Update with the desired region for SNS
}

variable "queue_name" {
  description = "The name of the SQS queue."
  default     = "demo-queue"
}

variable "threshold" {
  description = "The threshold for the CloudWatch Alarm."
  default     = 5
}

variable "sns_topic_name" {
  description = "The name of the SNS topic."
  default     = "demo-topic"
}

variable "team1_email" {
  description = "Email address for Team 1 subscription."
  default     = "nehapithadiya444@gmail.com"
}

variable "team2_email" {
  description = "Email address for Team 2 subscription."
  default     = "team2@example.com"
}
