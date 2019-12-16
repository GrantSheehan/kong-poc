resource "kong_plugin" "rate_limit" {
  name        = "rate-limiting"
  config_json = <<EOT
	{
		"second": 5,
		"hour" : 1000
	}
EOT
}
