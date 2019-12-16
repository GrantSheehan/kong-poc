resource "kong_service" "service" {
  name     = "test"
  protocol = "http"
  host     = "mockbin.org"
  port     = 80
  //path     	= "/mypath"
  retries         = 5
  connect_timeout = 1000
  write_timeout   = 2000
  read_timeout    = 3000
}
