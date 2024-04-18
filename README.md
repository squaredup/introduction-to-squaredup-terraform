# Getting Started with the SquaredUp Terraform Provider
The below three examples show how you can use Infrastructure as Code (IaC) techniques to manage your SquaredUp landscape.  These examples are just to get your ideas started, and once you are rolling full documentation on the provider can be found in the [Terraform Provider Repo](https://github.com/squaredup/terraform-provider-squaredup/blob/main/docs/index.md).

## Barebones Basic Dashboard
Looking to see what the absolute minimum needed to get connected?  In about 50 lines this shows how to get your connected and create a pretty boring initial dashboard.
![image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/b7dc3eae-1087-4872-9d7d-ff95691cf665)

## Extending an Existing Data Source
Once your partway along your journey we'll take a look at using one of the AWS data sources you've configured in SquaredUp Cloud and creating an additional dashboard via Terraform.  This demo goes one step further and uses a JSON object list to specify important Lambda Functions and then creates a dashboard for each one, in a new workspace.
![image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/8f63b0a2-38af-4082-a414-805455389dce)

## Using Variables and Deploying Data Sources
The last demo example introduces variables to our Terraform template and deploys a new data source along the way.
![image](https://github.com/squaredup/introduction-to-squaredup-terraform/assets/17866458/7facb8d1-2e5d-4210-ab16-4b0477b760a9)
