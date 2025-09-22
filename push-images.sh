#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/mysql:8.4
docker push cimg/mysql:8.4.6
docker push cimg/mysql:8.4.5
docker push cimg/mysql:8.4.4
docker push cimg/mysql:8.4.3
docker push cimg/mysql:8.4.2
