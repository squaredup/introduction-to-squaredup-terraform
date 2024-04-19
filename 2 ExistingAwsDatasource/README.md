# Extending an Existing Data Source

This example builds on the Barebones demo, leveraging a JSON file and an existing AWS data source to visualize key metrics from your AWS Lambda functions.

## Steps to Configure

1. [Install Terraform](https://developer.hashicorp.com/terraform/install) if you have not already done so.
2. Update the placeholders with your specific values:
   - API key and Region in the Provider Settings: Replace `myApiKeyGoesHere` with your actual API key.
   - AWS datasource ID in the locals block: Replace `config-someIdFromYourAwsDatasource` with your AWS datasource ID.
   - For `important_lambdas.json`, ensure it lists the Lambda functions you want to monitor.
3. Initialize and apply Terraform:
   - Execute `terraform init` to prepare your Terraform environment.
   - Run `terraform apply` to deploy the configurations. Confirm the actions to proceed.

## Detailed Configuration

The Terraform configuration sets up a workspace and a dashboard for each specified Lambda function using data fetched from AWS. The JSON file, `important_lambdas.json`, lists the Lambda functions you are focusing on:

```json
[
    {
        "lambdaName": "global-common-api"
    },
    {
        "lambdaName": "global-common-auth"
    },
    {
        "lambdaName": "plugin-amazon-web-services"
    }
]
```

## Visualizing the Dashboard

Once Terraform applies your configuration, it creates a dashboard for each Lambda function specified in the JSON file. Each dashboard provides insights into the performance and status of the Lambda functions over the last seven days.

Placeholder for dashboard screenshot

## Security Note

Keep your API keys and datasource IDs secure and avoid exposing them in public repositories.

## Troubleshooting

If issues arise during the initialization or application phases, check your configuration values for accuracy, ensure network connectivity, and refer to the Terraform logs for detailed error information.
