#!/usr/bin/env bash

tagname="eu.gcr.io/"$(gcloud config get-value project)"/demoapp:latest"
region="europe-north1"

gcloud run deploy demoapp --image $tagname --region $region --platform managed --allow-unauthenticated
