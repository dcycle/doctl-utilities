#!/bin/bash
#
# Delete all VMs with a given name.
#
set -e

# The token must be set as an environment variable
if [ -v "$DIGITALOCEAN_ACCESS_TOKEN" ]; then
  >&2 echo "Please set the DIGITALOCEAN_ACCESS_TOKEN environment variable"
  exit 1
fi

# The name must be set as an argument.
if [ -v "$$1" ]; then
  >&2 echo "Please pass the name as an argument."
  exit 1
else
  NAME=$1
fi

# https://www.digitalocean.com/community/questions/doctl-compute-droplet-delete-xyz-when-there-are-1-droplets-with-the-name-xyz
doctl compute droplet list --format "ID,Name" --no-header | grep " $NAME" | awk '{print $1}' | xargs -I {} doctl compute droplet delete {} -f
