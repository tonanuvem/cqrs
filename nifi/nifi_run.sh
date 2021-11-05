docker run --rm --name nifi \
  -e NIFI_WEB_HTTP_PORT=8080 \
  -p 8090:8080 \
  -v ./templates/:/opt/nifi/conf/templates/ \
  -d \
  apache/nifi:latest
