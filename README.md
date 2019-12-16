# Kong API Gateway POC

## Prerequisites

* Install the third-party Kong [Terraform
  provider](https://github.com/kevholditch/terraform-provider-kong)

## Steps

* `docker-compose up` to start the Postgres container, the Kong DB migration, and the Kong
  container. Since postgres can take a few seconds to start the first time it's
  run, you may need to do this twice.
* `terraform apply` to create the Kong resources for an example service, route,
  along with auth and rate-limiting plugins

## Test

After everything is running and terraform has been applied, you should be able
to run 
```
curl -X GET \
 --url http://localhost:8000/ \
 --header "Host: example2.com" \
 --header "apikey: my_key"
```

And get output that looks similar to this:
```
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 10695
Connection: keep-alive
Server: Cowboy
Etag: W/"29c7-XG+PICJmz/J+UYWt5gkKqqAUXjc"
Vary: Accept-Encoding
Date: Mon, 16 Dec 2019 17:10:25 GMT
Via: kong/1.4.2
X-Kong-Upstream-Status: 200
X-Kong-Upstream-Latency: 58
X-Kong-Proxy-Latency: 598
Kong-Cloud-Request-ID: c0a64607b6aa1b93d4b81df7a880ac2f
X-RateLimit-Remaining-hour: 998
X-RateLimit-Limit-second: 5
X-RateLimit-Remaining-second: 4
X-RateLimit-Limit-hour: 1000

<!DOCTYPE html><html><head><meta charset="utf-8"><title>Mockbin by
Kong</title><...snip....>
  analytics.load('<token>');
  analytics.page()
}}();</script></body></html>
```
