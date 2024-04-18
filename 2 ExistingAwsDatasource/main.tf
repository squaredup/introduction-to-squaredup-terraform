terraform {
  required_providers {
    squaredup = {
      source = "squaredup/squaredup",
    }
  }
}

provider "squaredup" {
  region  = "us"
  api_key = "myApiKeyGoesHere"  # Update this with your API key
}

locals {
  aws_datasource_id = "config-someIdFromYourAwsDatasource"  # Update this with the ID of your AWS datasource
  important_lambdas = [for lambda in jsondecode(file("${path.module}/important_lambdas.json")) : lambda.lambdaName]
}

resource "squaredup_workspace" "aws_workspace" {
  display_name      = "AWS Testing Workspace"
  description       = "The workspace for AWS"
  type              = "service"
  tags              = ["Terraform", "Automated Testing", "AWS"]
  datasources_links = [local.aws_datasource_id]
}

data "squaredup_nodes" "important_lambda_nodes" {
  for_each      = toset(local.important_lambdas)
  data_source_id = local.aws_datasource_id
  node_name      = each.value
  allow_no_data = true
}

resource "squaredup_dashboard" "aws_dashboard" {
  for_each = data.squaredup_nodes.important_lambda_nodes
  display_name       = each.key
  timeframe          = "last7days"
  workspace_id       = squaredup_workspace.aws_workspace.id
  dashboard_template = file("${path.module}/lambda_dashboard.json")
  template_bindings = jsonencode({
    aws_datasource_id = local.aws_datasource_id
    lambda_node_id    = each.value.node_properties[0].id
  })
}
