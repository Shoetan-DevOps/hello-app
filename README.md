
# Introduction
This will deploy an application stack to output "Hello world <hosname>"

# Components
- Hello web app 
- Traefik reverse poxy (ingress)
- Prometheus

# Pre req
- k8s Cluster
- Helm
- Kubectl
- Git

# Steps

## Step 1: Clone the repo
Clone the repo 
```
    git clone https://github.com/Shoetan-DevOps/hello-app.git
```

## Step 2: Run the deploy.sh script
```
    cd hello-app/
    sh deploy.sh
```

# Deployment Output
```
> Prometheus
    - namespace: monitorring
    - components:
        - kube-state-metrics
        - prometheus-pushgateway
        - server
> Traefik
    - namespace: webapp
    - components:
        - traefik
> webapp (hello world)
    - namespace: webapp
    - components:
        - webapp
```


