#!/bin/bash

# This is to build the initial Docker resource for Concourse

docker build -t flowdock-concourse-notification-resource .
docker run -P -i -t flowdock-concourse-notification-resource /bin/bash
# docker tag
# docker push
