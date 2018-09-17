#!/bin/bash

image_names=( \
    frp \
    gost \
    redir \
)

for name in ${image_names[@]}; do
    echo "building image: $name"
    docker-compose run --rm -e DOCKERFILE_PATH=/$name -e IMAGE_NAME=VyronLee/$name builder || echo "build error!"
done

