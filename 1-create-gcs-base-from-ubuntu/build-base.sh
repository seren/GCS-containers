#!/bin/bash
#####
# Builds an generic image with GridFTP/Globus Connect installed but not configured
#####

set -euo pipefail


######################################
# Script functions
######################################
# Function that works in bash and dash

# Function to call on error
function errorhandler {
  set +x
  echo "There was an error"
}
trap errorhandler ERR

docker build --tag=local/gcs-base -f base-Dockerfile .
