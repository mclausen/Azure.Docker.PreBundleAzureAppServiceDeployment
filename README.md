# Azure.Docker.PreBundleAzureAppServiceDeployment
Sample of how to pre-bundle an Azure Web App Deployment into a Docker Container.

## Why
Bundling and deploying into Azure App Service is quite easy Bundling and deploying into Azure App Service where each Azure App Service has a little difference in configuration or content can be very time consuming. Deploying those in mass lets say 10 at the time, can be extremely time consuming.

## What
Provision and configure bundle when the container is build, eliminating time spend needed to unzip, initialize git and other long running operations in the deployment phase.

## How
Building docker image does the following.
1. Copy the bundle zip package into the container
2. Copy the PushBundle script into the containre
3. Unzip the bundle
4. Initialize git in the unpacked bundle and create initial commit.

Running the container does the following.
1. Push the git deployment into Azure App Service

## Infrastructure Prerequisites
Create Azure App Service using Azure CLI

``` bash
// Create resource group
az group create --name <my-resource-group> --location westeuropee

// Create App Service Plan
az appservice plan create --name <app-plan-name> --resource-group <my-resource-group> --sku B1

// Create Web App
az webapp create -g <my-resource-group>  -p <app-plan-name> -n <web-app-name> --deployment-local-git
```

Note the app service name and deployment credentials.

## Usage
Building the docker image
``` bash
docker build --pull --rm -f "Dockerfile" -t <name of image>:latest "."
```

Deploy the bundle
``` bash
docker run -it --env-file variables.env <name of image>  
```