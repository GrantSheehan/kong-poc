resource "kong_consumer" "consumer" {
  username = "User1"
}

resource "kong_consumer_plugin_config" "consumer_key-auth" {
  consumer_id = kong_consumer.consumer.username
  plugin_name = "key-auth"
  config_json = <<EOT
	{
		"key": "my_key"
	}
EOT
}
