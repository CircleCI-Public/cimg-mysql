#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 5.7/Dockerfile -t cimg/mysql:5.7.38  -t cimg/mysql:5.7 .
