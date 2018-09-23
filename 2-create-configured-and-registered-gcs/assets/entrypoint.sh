#!/bin/bash

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

service myproxy-server start
# we run it non-daemonized so that the entrypoint script doesn't exit
/usr/sbin/globus-gridftp-server -c /etc/gridftp.conf -pidfile /var/run/globus-gridftp-server.pid


# wait?










