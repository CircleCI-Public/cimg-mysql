#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 8.4/Dockerfile -t cimg/mysql:8.4.7 -t cimg/mysql:8.4 --platform linux/amd64 --push .
