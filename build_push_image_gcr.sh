#!/usr/bin/env bash

tagname="eu.gcr.io/"$(gcloud config get-value project)"/demoapp:latest"
docker build -t $tagname .
docker push $tagname

