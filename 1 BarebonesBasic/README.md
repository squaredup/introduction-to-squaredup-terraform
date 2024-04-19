# Barebones Basic Dashboard

This demo provides the essentials needed to create your first dashboard via Terraform. If you're eager to connect and explore on your own, this quick demo involves just three steps to get you started.

1. [Install Terraform](https://developer.hashicorp.com/terraform/install) - Follow this guide to install Terraform on your machine.
2. Populate the placeholders with values from your environment:
   - API key and Region in the Provider Settings: Refer to [SquaredUp Documentation](https://support.squaredup.com/hc/en-us/articles/13234653555869-API-Keys) to obtain your API key.
   - `workspace_id` in the `squaredup_dashboard` resource: Find your workspace ID using the guide [Getting Your Workspace ID](Getting_your_workspaceId).
3. Initialize and apply Terraform:
   - Run `terraform init` to initialize the setup. This command prepares your directory for Terraform operations.
   - Execute `terraform apply` to apply the configurations. Confirm the actions Terraform proposes before it makes changes to your infrastructure.

Once completed, you will have a simple, yet fully Terraform-created dashboard:
![image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/ad7ef497-ae3a-4aef-b4b5-33e835303ea9)

## Additional Information

### Getting Your Workspace ID
To locate your workspace ID, navigate to your desired workspace and extract the ID from the URL, as highlighted in the screenshot below. The ID starts with `space-`.

![workspace ID image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/c4b15730-8fb6-4acc-985f-eb3eff15c581)

### Security Note
Remember to keep your API key secure. Avoid publishing it in public repositories or sharing it in insecure environments.

### Troubleshooting
If you encounter issues during installation or application of Terraform, verify your API key and workspace ID, check for typos, and ensure your internet connection is stable.
