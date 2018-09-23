#!/bin/bash
#####
# Builds an image with GridFTP/Globus Connect installed and registered
#####

set -euxo pipefail


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

. assets/vars.conf

PORT_START=${FTP_PORT_RANGE%%,*}
PORT_END=${FTP_PORT_RANGE##*,}

docker run -p ${PROXY_PORT} -p ${FTP_CONTROL_PORT} -p ${PORT_START}-${PORT_END}:${PORT_START}-${PORT_END} local/gcs-configured

