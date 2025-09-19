#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 9.4/Dockerfile -t cimg/mysql:9.4.0 -t cimg/mysql:9.4 --platform linux/amd64 --push .
docker build --file 9.3/Dockerfile -t cimg/mysql:9.3.0 -t cimg/mysql:9.3 --platform linux/amd64 --push .
docker build --file 9.2/Dockerfile -t cimg/mysql:9.2.0 -t cimg/mysql:9.2 --platform linux/amd64 --push .
docker build --file 9.1/Dockerfile -t cimg/mysql:9.1.0 -t cimg/mysql:9.1 --platform linux/amd64 --push .
docker build --file 9.0/Dockerfile -t cimg/mysql:9.0.1 -t cimg/mysql:9.0 --platform linux/amd64 --push .
docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.6 -t cimg/mysql:8.4 --platform linux/amd64 --push .
docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.5 -t cimg/mysql:8.4 --platform linux/amd64 --push .
docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.4 -t cimg/mysql:8.4 --platform linux/amd64 --push .
docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.3 -t cimg/mysql:8.4 --platform linux/amd64 --push .
docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.2 -t cimg/mysql:8.4 --platform linux/amd64 --push .
docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.1 -t cimg/mysql:8.4 --platform linux/amd64 --push .
docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.0 -t cimg/mysql:8.4 --platform linux/amd64 --push .
docker build --file 8.3/Dockerfile -t cimg/mysql:8.3.0 -t cimg/mysql:8.3 --platform linux/amd64 --push .
docker build --file 8.2/Dockerfile -t cimg/mysql:8.2.0 -t cimg/mysql:8.2 --platform linux/amd64 --push .
docker build --file 8.1/Dockerfile -t cimg/mysql:8.1.0 -t cimg/mysql:8.1 --platform linux/amd64 --push .
