#!/usr/bin/env bash

docker build . -t eu.gcr.io/stijn-koopal-speeltuin/helloworld-go
docker push eu.gcr.io/stijn-koopal-speeltuin/helloworld-go