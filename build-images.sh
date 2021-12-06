#!/usr/bin/env bash

docker build --file 5.7/Dockerfile -t cimg/mysql:5.7.36  -t cimg/mysql:5.7 .
docker build --file 8.0/Dockerfile -t cimg/mysql:8.0.27  -t cimg/mysql:8.0 .
