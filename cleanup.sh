#!/bin/sh

read -p "This will delete all notebooks and data in the database!!! Are you sure? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
    echo "Shutting down containers..."
    docker stop notebooks
    docker stop gremlin-server

    echo "Deleting containers..."
    docker rm notebooks
    docker rm gremlin-server

    echo "Delete graphlab network..."
    docker network rm graphlab

    echo "Complete!"
fi