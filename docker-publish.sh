#!/bin/bash

# This is intended to be run inside the docker container as the command of the docker-compose.
set -ex
docker-compose -f .ci/docker-compose.yml run logstash bundle exec rake vendor
docker-compose -f .ci/docker-compose.yml run logstash -e GEM_HOST_API_KEY bundle exec rake publish_gem
