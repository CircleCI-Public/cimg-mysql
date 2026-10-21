#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 26.10/Dockerfile -t cimg/mysql:26.10.0 -t cimg/mysql:26.10 --platform linux/amd64 --push .
docker build --file 9.7/Dockerfile -t cimg/mysql:9.7.4 -t cimg/mysql:9.7 --platform linux/amd64 --push .
docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.13 -t cimg/mysql:8.4 --platform linux/amd64 --push .
