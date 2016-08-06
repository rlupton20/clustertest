#!/usr/bin/env nix-shell
#!nix-shell -i sh -p python27Packages.docker_compose

# First build the image
nix-build node.nix -A image
docker load < result

# Then run some number of copies of it
docker-compose up &
docker-compose scale node=$1
