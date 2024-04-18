# Using Variables and Deploying Data Sources

As your Terraform created dashboards and workspaces grow so will the complexity.  This example introduces a `variables.tf` file and can use a `terraform.tfvars` file similar to the below to get things configured.

## Setting variables via `terraform.tfvars`
Create a file named terraform.tfvars in the **3 AzureDeployment** folder with all of the variables need.

```tfvar
squaredup_api_key = "MyApiKeyHere"
azure_tenant_id = "Azure Tenant ID GUID"
azure_client_id = "Azure Client ID GUID"
azure_client_secret = "Azure App client secret"
azure_subscription_id = "Azure Subscription ID"
azure_vm_name = "A name of a VM"
azure_target_subscription_name = "The name of a subscription"
```
