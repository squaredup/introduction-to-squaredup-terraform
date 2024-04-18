terraform {
  required_providers {
    squaredup = {
      source = "squaredup/squaredup",
    }
  }
}

provider "squaredup" {
  region  = "us"
  api_key = "AddYourApiKeyHere"  # Update this with your API key
}

resource "squaredup_dashboard" "basic_static_dashboard" {
  workspace_id       = "space-anExistingWorkspace" # Update this with the ID of your workspace
  display_name       = "Terraform: Basic Static Dashboard"
  timeframe          = "last7days"
  dashboard_template = <<EOT
  {
  "_type": "layout/grid",
  "contents": [
    {
      "x": 0,
      "h": 2,
      "i": "1",
      "y": 0,
      "config": {
        "title": "My First Tile!",
        "description": "",
        "_type": "tile/text",
        "visualisation": {
          "config": {
            "content": "{{text_block}}",
            "autoSize": true,
            "fontSize": 16,
            "align": "center"
          }
        }
      },
      "w": 4
    }
  ],
  "columns": 4,
  "version": 2
}
EOT
  template_bindings = jsonencode({
    text_block = "Hello, World!!" # Edit this to change the text displayed on the tile
  })
}
