#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "usage: setup.sh [notebook_password]"
    exit 0
fi

echo "Validate docker is installed and running...."

if [[ $(ps -ef | grep "[d]ocker serve") ]]; then
    echo "Docker running. Deploying graphlab."
else
    echo "Please start docker and retry."
    exit 0
fi

echo "Fetching container images from docker hub..."
docker pull triggan/gremlin-server-mac-m1:latest
docker pull triggan/graph-notebook-mac-m1:latest

echo "Creating a new container network..."
docker network create graphlab

echo "Launching containers..."
docker run -p 8182:8182 --name gremlin-server --network graphlab -d triggan/gremlin-server-mac-m1:latest
docker run \
--env GRAPH_NOTEBOOK_AUTH_MODE="DEFAULT" \
--env GRAPH\_NOTEBOOK\_HOST="gremlin-server" \
--env GRAPH_NOTEBOOK_PORT="8182" \
--env NEPTUNE_LOAD_FROM_S3_ROLE_ARN="" \
--env AWS_REGION="us-east-1" \
--env NOTEBOOK_PORT="8888" \
--env LAB_PORT="8889" \
--env GRAPH_NOTEBOOK_SSL="False" \
--env NOTEBOOK\_PASSWORD="$1" \
--name notebooks \
--network graphlab \
-p 8888:8888 \
-d triggan/graph-notebook-mac-m1:latest

echo "Complete! Browse to http://localhost:8888 to connect to Jupyter."