#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 8.0/Dockerfile -t cimg/mysql:8.0.33 -t cimg/mysql:8.0 .

docker build --file 8.0.32/Dockerfile -t cimg/mysql:8.0.32 .
