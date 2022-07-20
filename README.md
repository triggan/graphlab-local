# graphlab-local
Local deployment of graph-notebook, gremlin-server, and blazegraph.

## Dependencies

Docker is the primary requirement. The stack includes container images for both `linux/amd64` and `linux/arm64`.  If using another platform, you may need Docker Desktop or some other platform emulator.

## Starting the Stack

To launch the stack, clone this repo to your local machine and launch the containers using the `setup.sh` script.  Include a password for the included Jupyter notebook installation.

`git clone https://github.com/triggan/graphlab-local.git`

`sh ./graphlab-local/setup.sh <your-chosen-jupyter-notebook-password>`

## Stopping and Tearing Down the Stack

To stop the stack and delete the containers:

`sh ./graphlab-local/cleanup.sh`

## Important Info

This stack currently uses container images that were built in a bespoke fashion.  Eventually, I'll include the associated Dockerfiles or sources for users to build their own (updated) images.  For the time being, the associated images for this stack can be found at https://hub.docker.com/u/triggan.