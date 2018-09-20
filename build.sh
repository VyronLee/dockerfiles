#!/bin/bash

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

for NAME in $(ls -d */ | xargs basename); do
    echo "building image: $NAME"
    cd $NAME
    docker build -t $DOCKER_PASS/$NAME:latest . || { echo "build failed!"; exit 1; }
    docker push $DOCKER_PASS/$NAME
    cd -
done

