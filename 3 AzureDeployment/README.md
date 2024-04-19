# Using Variables and Deploying Data Sources

This example progresses from static configuration to a more dynamic setup using variables in Terraform, allowing for easier management and scaling of infrastructure as code. You'll learn how to define and utilize variables to deploy data sources and dashboards efficiently.

## Overview of Variables

[Variables in Terraform](https://developer.hashicorp.com/terraform/language/values/variables) (`variables.tf`) are placeholders that store values which can be used in your Terraform configuration. This approach promotes reusability and flexibility, allowing you to change inputs without altering the core logic of your Terraform files.

## Setting Up Variables

Create a `terraform.tfvars` file in the **3 AzureDeployment** folder, where you will specify all the necessary values for the deployment:

```tfvar
squaredup_api_key = "MyApiKeyHere"
azure_tenant_id = "Azure Tenant ID GUID"
azure_client_id = "Azure Client ID GUID"
azure_client_secret = "Azure App client secret"
azure_subscription_id = "Azure Subscription ID"
azure_vm_name = "A name of a VM"
azure_target_subscription_name = "The name of a subscription"
```

This file will feed the variables you defined in `variables.tf` directly into your Terraform configuration, streamlining the setup process.

## Applying the Configuration

Initialize and apply your Terraform configuration with these commands:

- `terraform init` — Initialize the environment to prepare Terraform to manage your infrastructure.
- `terraform apply` — Apply the configuration defined in your Terraform files.

## What You Will Create

The configuration provided will deploy the following:

- Data sources for Azure, set up using provided Azure credentials.
- A workspace and multiple dashboards that display data from the configured Azure resources.

![image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/aecd66d2-0552-4f73-a462-685cc24f8e94)


![image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/0c7ac970-6fd2-4e8c-9fc0-bd2b17a11241)

## Security Note

Always keep your API keys and sensitive credentials out of public repositories. Use environment variables or secure secret management tools to manage them safely.

## Troubleshooting

Encounter issues? Verify your variable values, check for typos, and ensure network connectivity. Logs provided by Terraform during initialization and application can offer detailed insights into any errors encountered.
