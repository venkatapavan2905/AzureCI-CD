#!/bin/bash

set -x

REPO_URL="https://github.com/venkatapavan2905/AzureCI-CD.git"

git clone "$REPO_URL" /tmp/temp_repo

cd /tmp/temp_repo

sed -i "s|image:.*|image: azurecicdregistry.azurecr.io/$2:$3|g" K8-Manifests/$1-deployment.yml

git add .

git commit -m "Updated K8s Manifest"

git push

rm -rf /tmp/temp_repo