docker run --rm --name nifi \
  -e NIFI_WEB_HTTP_PORT=8080
  -p 8090:8080 \
  -d \
  apache/nifi:latest
