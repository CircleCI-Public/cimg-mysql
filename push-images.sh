#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/mysql:26.10
docker push cimg/mysql:26.10.0
docker push cimg/mysql:9.7
docker push cimg/mysql:9.7.4
docker push cimg/mysql:8.4
docker push cimg/mysql:8.4.13
