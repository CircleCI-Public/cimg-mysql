#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 9.7/Dockerfile -t cimg/mysql:9.7.2 -t cimg/mysql:9.7 --platform linux/amd64 --push .
