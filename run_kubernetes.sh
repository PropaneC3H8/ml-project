#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=propanec3h8/ml-project

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-project --image=$dockerpath --port=80 --labels app=ml-project

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
APP=$(kubectl get pod -l app=ml-project -o=jsonpath="{.items[0].metadata.name}")
kubectl port-forward $APP --address 0.0.0.0 8000:80
