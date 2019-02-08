#!/usr/bin/env bash

export CLUSTER_NAME=knative
export CLUSTER_ZONE=europe-west1-b

export PROJECT=stijn-koopal-speeltuin

# -- CREATE PROJECT
#gcloud projects create ${PROJECT} --set-as-default

# -- USE DEFAULT PROJECT
#gcloud config set core/project ${PROJECT}

#gcloud services enable \
#  cloudapis.googleapis.com \
#  container.googleapis.com \
#  containerregistry.googleapis.com
#

# -- CREATE CLUSTER
#gcloud container clusters create ${CLUSTER_NAME} \
#  --zone=${CLUSTER_ZONE} \
#  --cluster-version=latest \
#  --machine-type=n1-standard-4 \
#  --enable-autoscaling --min-nodes=1 --max-nodes=10 \
#  --enable-autorepair \
#  --scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore \
#  --num-nodes=3

# -- PERMISSIONS TO CLUSTER FOR CURRENT USER
#kubectl create clusterrolebinding cluster-admin-binding \
#    --clusterrole=cluster-admin \
#    --user=$(gcloud config get-value core/account)

# -- ENABLE ISTIO
#kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/istio-crds.yaml && \
#kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/istio.yaml

# -- LABEL ISTIO
#kubectl label namespace default istio-injection=enabled

# -- INSTALL KNATIVE
#kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/serving.yaml \
#    --filename https://github.com/knative/build/releases/download/v0.3.0/release.yaml \
#    --filename https://github.com/knative/eventing/releases/download/v0.3.0/release.yaml \
#    --filename https://github.com/knative/eventing-sources/releases/download/v0.3.0/release.yaml \
#    --filename https://github.com/knative/serving/releases/download/v0.3.0/monitoring.yaml
