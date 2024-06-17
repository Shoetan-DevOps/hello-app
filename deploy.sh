#!/bin/bash

set -e

# Define namespaces
PROMETHEUS_NAMESPACE="monitoring"
WEBAPP_NAMESPACE="webapp"

# add helm repos
helm repo add traefik https://traefik.github.io/charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Function to create namespace if it doesn't exist
create_namespace() {
  local namespace=$1
  if ! kubectl get namespace "$namespace" >/dev/null 2>&1; then
    echo "Creating namespace: $namespace"
    kubectl create namespace "$namespace"
  else
    echo "Namespace $namespace already exists"
  fi
}

# Create namespaces
create_namespace "$PROMETHEUS_NAMESPACE"
create_namespace "$WEBAPP_NAMESPACE"

# Deploy Prometheus Helm chart
echo "Deploying Prometheus Helm chart..."
helm upgrade --install prometheus ./charts/prometheus/ --namespace "$PROMETHEUS_NAMESPACE"

# Deploy webapp Helm chart with Prometheus as dependency
echo "Deploying webapp and traefik Helm chart..."
helm upgrade --install webapp ./charts/webapp/ --namespace "$WEBAPP_NAMESPACE"

echo "Deployment completed successfully!"
