terraform {
  required_providers {
    squaredup = {
      source = "squaredup/squaredup",
    }
  }
}

provider "squaredup" {
  region  = "us"
  api_key = var.squaredup_api_key
}

resource "squaredup_datasource" "azure_plugin_for_test" {
  display_name     = "Terraform: ${var.azure_plugin_name}"
  data_source_name = var.azure_plugin_name
  config = jsonencode({
    authentication    = "explicit"
    azureTenantId     = var.azure_tenant_id
    azureClientId     = var.azure_client_id
    azureClientSecret = var.azure_client_secret
    subscriptions = [
      {
        value = var.azure_subscription_id
      }
    ]
    managementGroups = [
      {
        value = var.azure_tenant_id
      }
    ]
  })
}

data "squaredup_nodes" "supportVM_host_node" {
  depends_on     = [squaredup_datasource.azure_plugin_for_test]
  data_source_id = squaredup_datasource.azure_plugin_for_test.id
  node_name      = var.azure_vm_name
}

data "squaredup_nodes" "ea_playground_subscription" {
  depends_on     = [squaredup_datasource.azure_plugin_for_test]
  data_source_id = squaredup_datasource.azure_plugin_for_test.id
  node_name      = var.azure_target_subscription_name
}

resource "squaredup_workspace" "application_workspace" {
  display_name      = "Terraform: Testing ${var.azure_plugin_name}"
  description       = "The workspace for ${var.azure_plugin_name} testing, please don't tamper with it!"
  type              = "other"
  tags              = ["Terraform", "Automated Testing", var.azure_plugin_name]
  datasources_links = [squaredup_datasource.azure_plugin_for_test.id]
}

resource "squaredup_dashboard" "support_vm_dashboard" {
  display_name       = "Terraform: VM Details"
  timeframe          = "last7days"
  workspace_id       = squaredup_workspace.application_workspace.id
  dashboard_template = file("support_vm_dashboard.json")
  template_bindings = jsonencode({
    plugin_config_id   = squaredup_datasource.azure_plugin_for_test.id
    support_vm_node_id = data.squaredup_nodes.supportVM_host_node.node_properties[0].id
  })
}

resource "squaredup_dashboard" "cost_budgeting_dashboard" {
  display_name       = "Terraform: Cost and Budgeting"
  timeframe          = "last7days"
  workspace_id       = squaredup_workspace.application_workspace.id
  dashboard_template = file("cost_and_budgeting_dashboard.json")
  template_bindings = jsonencode({
    plugin_config_id           = squaredup_datasource.azure_plugin_for_test.id
    ea_playground_subscription = data.squaredup_nodes.ea_playground_subscription.node_properties[0].id
  })
}
