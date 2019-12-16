resource "kong_route" "route" {
  name           = "MyRoute"
  protocols      = ["http", "https"]
  methods        = ["GET", "POST"]
  hosts          = ["example2.com"]
  paths          = ["/"]
  strip_path     = true
  preserve_host  = false
  regex_priority = 1
  service_id     = "${kong_service.service.id}"
}
