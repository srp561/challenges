#!/bin/bash

DOCKER_REPO_URI=868981377508.dkr.ecr.eu-west-1.amazonaws.com/challenges


function build() {
    echo "Building image"
    docker build -t challenges .
}

function push() {
    echo "Push image"
    $(aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 868981377508.dkr.ecr.eu-west-1.amazonaws.com)

    docker tag challenges:latest $DOCKER_REPO_URI/challenges:latest

    docker push $DOCKER_REPO_URI/challenges:latest
}

function options() {
      echo "./start build -> Build docker images"
      echo "./start push -> Push images to docker registry. Plz configure repo  before push."
}



for var in "$@"
do
  case "$var" in
    build)
      build
      ;;
    push)
      push
      ;;      
    *)
      options
      ;;
  esac    
done
