resource "kong_plugin" "auth" {
	name        = "key-auth"
	service_id = "${kong_service.service.id}"
}
