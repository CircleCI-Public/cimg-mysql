#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/mysql:9.4
docker push cimg/mysql:9.4.0
docker push cimg/mysql:9.3
docker push cimg/mysql:9.3.0
docker push cimg/mysql:9.2
docker push cimg/mysql:9.2.0
docker push cimg/mysql:9.1
docker push cimg/mysql:9.1.0
docker push cimg/mysql:9.0
docker push cimg/mysql:9.0.1
docker push cimg/mysql:8.4
docker push cimg/mysql:8.4.6
docker push cimg/mysql:8.4.5
docker push cimg/mysql:8.4.4
docker push cimg/mysql:8.4.3
docker push cimg/mysql:8.4.1
docker push cimg/mysql:8.4.0
