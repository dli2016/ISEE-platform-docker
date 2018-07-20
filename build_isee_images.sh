#!/bin/bash

# ISEE Related Information
IMG_TYPE=$1
MASTER='master'
SLAVE='slave'
# Image information
DOCKER_FILE_PATH=dockerfiles/$IMG_TYPE/Dockerfile
IMAGE_NAME=cripac/isee-$IMG_TYPE
TAG=0.1.0
# Image setups
# Memory Limit: -m=100m
MEMORY_LIMIT=
# CPU Limits:
CPU_LIMITS=

#===========================================================
# You may not modify following codes
#===========================================================
if [ $# = 0 ]
then
    echo "Usage: sh build_isee_images.sh master/slave"
    exit 1
fi

if [ "$IMG_TYPE" != "$MASTER" -a "$IMG_TYPE" != "$SLAVE" ]
then
    echo "Only 'master/slave' is supported."
fi

echo "Build the image of $IMG_TYPE"
docker build $MEMORY_LIMIT $CPU_LIMITS -t $IMAGE_NAME:$TAG -f $DOCKER_FILE_PATH .
