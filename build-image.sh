#!/bin/sh

# Create docker image containing kops tools and scripts

# @author  Fabrice Jammes

set -e
#set -x

DIR=$(cd "$(dirname "$0")"; pwd -P)

KUBECTL_VERSION="1.27.3"
IMAGE="k8sschool/kubectl-proxy:$KUBECTL_VERSION"

# CACHE_OPT="--no-cache"

docker build --build-arg KUBECTL_VERSION="$KUBECTL_VERSION" --tag "$IMAGE" "$DIR"
docker push "$IMAGE"
