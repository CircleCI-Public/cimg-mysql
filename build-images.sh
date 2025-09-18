#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker context create cimg
docker buildx create --use cimg
docker buildx build --platform=linux/amd64,linux/arm64 --file 8.1/Dockerfile -t cimg/mysql:8.1 -t cimg/mysql:8.1 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 8.2/Dockerfile -t cimg/mysql:8.2 -t cimg/mysql:8.2 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 8.3/Dockerfile -t cimg/mysql:8.3 -t cimg/mysql:8.3 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 9.0/Dockerfile -t cimg/mysql:9.0 -t cimg/mysql:9.0 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 9.1/Dockerfile -t cimg/mysql:9.1 -t cimg/mysql:9.1 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 9.2/Dockerfile -t cimg/mysql:9.2 -t cimg/mysql:9.2 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 9.3/Dockerfile -t cimg/mysql:9.3 -t cimg/mysql:9.3 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 9.4/Dockerfile -t cimg/mysql:9.4 -t cimg/mysql:9.4 --push .
