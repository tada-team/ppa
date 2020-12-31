#!/bin/bash
docker-compose up -d --build
docker-compose run --rm builder libvips/build.sh
