#!/bin/bash

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

IMAGE_NAMES=($(find . -type d -not -wholename "./.*" -not -wholename "." -exec basename {} \;))

for NAME in ${IMAGE_NAMES[@]}; do
    echo "building image:" $NAME
    cd $NAME
    docker build -t vyronlee/$NAME:latest . || { echo "build failed!"; exit 1; }
    docker push vyronlee/$NAME
    cd -
done

