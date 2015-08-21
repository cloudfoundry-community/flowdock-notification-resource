#!/bin/bash

docker build -t qofthings/flowdock-concourse-notification-resource .
# docker run -P -i -t flowdock-concourse-notification-resource /bin/bash
# docker tag
docker push qofthings/flowdock-concourse-notification-resource
