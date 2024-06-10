# Setting up CloudWatch Alarms for SQS Queue Utilization using Terraform

This Terraform configuration provisions an SQS queue and sets up CloudWatch Alarms to monitor the queue's utilization. The alarms automatically get implemented whenever new resources are created, fulfilling the requirement of intervention-free monitoring.

## Prerequisites

1. **Terraform**: Ensure that Terraform is installed on your machine. You can download it from [terraform.io](https://www.terraform.io/downloads.html).
   
2. **AWS CLI**: Install and configure the AWS CLI on your machine. You can download it from [here](https://aws.amazon.com/cli/).

## Usage

1. **Clone the Repository**: Clone this repository to your local machine.

2. **Navigate to the Directory**: Open a terminal and navigate to the directory where the Terraform configuration files are located.

3. **Initialize Terraform**: Run the following command to initialize Terraform in the directory:

     terraform init 

4. **Review Variables (Optional)**: Open the `variables.tf` file and review the variables. You can adjust the default values according to your requirements.

5. **Apply the Configuration**: Apply the Terraform configuration by running:

    terraform apply

6. **Verify Resources**: Once the configuration is applied successfully, verify that the SQS queue, CloudWatch Alarm, and SNS topic are created in the AWS Management Console.

7. **Monitor Alarms**: Monitor the SQS queue utilization through the CloudWatch Alarms. If the utilization exceeds the threshold, notifications will be sent to the subscribed email addresses.

## Customization

- **Region Configuration**: By default, resources will be provisioned in the `us-west-2` region. You can change the default region by updating the `sqs_region` variable in `variables.tf`.

- **Threshold**: The default threshold for the CloudWatch Alarm is set to `5`. You can adjust this threshold by updating the `threshold` variable in `variables.tf`.

- **SNS Topic Region**: The SNS topic can be created in a different region than the SQS queue. Update the `sqs_topic_region` variable in `variables.tf` to specify the region for the SNS topic.

- **Email Subscriptions**: You can add or modify email subscriptions for different engineering teams by updating the `team1_email` and `team2_email` variables in `variables.tf`.

## Clean Up

After testing or when you no longer need the resources, it's important to clean up to avoid incurring unnecessary charges:

1. Run the following command to destroy the resources created by Terraform:

   terraform destroy

2. Confirm the destruction when prompted.

3. Verify in the AWS Management Console that all resources have been removed.

## Security Considerations

- **AWS Credentials**: Ensure that you have appropriate AWS credentials configured either through environment variables, shared credentials file, IAM roles, or instance profiles. Always follow security best practices to protect your AWS credentials.

- **Least Privilege**: When creating IAM roles or users, follow the principle of least privilege and only grant permissions necessary for the resources and actions required.

- **Cross-Region Communication**: If your resources span multiple AWS regions, ensure that appropriate network configurations are in place to allow communication between them securely.

## Support

If you encounter any issues or have questions, feel free to open an issue in this repository or reach out to [your contact details].


<!-- 
## Instructions

1. Clone this repository.
2. Ensure Terraform is installed on your system.
3. Initialize Terraform by running `terraform init`.
4. Apply the Terraform configuration by running `terraform apply`.
5. Optionally, customize threshold values by updating the Terraform configuration.
6. Monitor the SQS queue utilization through CloudWatch Alarms.
7. Alert routing is configured to send notifications to different engineering teams through SNS subscriptions. -->
