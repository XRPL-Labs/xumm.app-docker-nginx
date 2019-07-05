#!/usr/bin/env bash

docker stop nginx-xign
docker rm nginx-xign
docker rmi xign/nginx
docker build -t xign/nginx .
docker run \
  --name nginx-xign \
  -d \
  --restart=always \
  -p 80:80 \
  -p 443:443 \
  --link xrpl-sign \
  -v $(pwd)/nginx-config:/etc/nginx \
  -v $(pwd)/ssl:/etc/nginx/ssl \
  -v $(pwd)/webroot:/usr/local/html \
  xign/nginx
