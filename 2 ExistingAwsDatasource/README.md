# Extending an Existing Data Source

This example builds on the Barebones demo, leveraging a JSON file and an existing AWS data source to visualize key metrics from your AWS Lambda functions.

## Steps to Configure

1. [Install Terraform](https://developer.hashicorp.com/terraform/install) if you have not already done so.
2. Update the placeholders with your specific values:
   - API key and Region in the Provider Settings: Replace `myApiKeyGoesHere` with your actual API key.
      - Refer to [SquaredUp Documentation](https://support.squaredup.com/hc/en-us/articles/13234653555869-API-Keys) to obtain your API key.
   - AWS datasource ID in the locals block: Replace `config-someIdFromYourAwsDatasource` with your AWS datasource ID.
   - For `important_lambdas.json`, ensure it lists the Lambda functions you want to monitor.
3. Initialize and apply Terraform:
   - Execute `terraform init` to prepare your Terraform environment.
   - Run `terraform apply` to deploy the configurations. Confirm the actions to proceed.

## Detailed Configuration

### Fetching the Datasource Id
SquaredUp data sources have an ID that starts with `config-` followed by a string of characters. To grab this ID, navigate to a workspace where it is configured, select the data source on the left-hand side, and then select the ID from the URL.
![image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/07d7ce57-ef5b-4259-b194-05bb43318cc6)

### Indicating Important Lambdas

The Terraform configuration utilizes the `important_lambdas.json` file to dynamically generate dashboards for each specified Lambda function. This approach allows for scalability and easy updates to the monitored Lambda list without altering the core Terraform code:

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

![image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/6eff0996-7f11-4903-a89b-4f33d08640c4)

## Security Note

Keep your API keys and datasource IDs secure and avoid exposing them in public repositories.

## Troubleshooting

If issues arise during the initialization or application phases, check your configuration values for accuracy, ensure network connectivity, and refer to the Terraform logs for detailed error information. Including screenshots of common errors here can help in quickly resolving issues.
