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
cat > assets/globus-connect-server.conf <<EOF
[Globus]
;User = %(GLOBUS_USER)s
;Password = %(GLOBUS_PASSWORD)s
User = ${GLOBUS_USER}
Password = ${GLOBUS_PASSWORD}

[Endpoint]
;Name = %(SHORT_HOSTNAME)s
;Public = False
Name = ${SHORT_HOSTNAME}
Public = True

[Security]
FetchCredentialFromRelay = True
IdentityMethod = MyProxy

[GridFTP]
Server = ${EXTERNAL_DNS_OR_IP}:${FTP_CONTROL_PORT}
ServerBehindNAT = ${BEHIND_NAT}
IncomingPortRange = ${FTP_PORT_RANGE}

[MyProxy]
Server = ${EXTERNAL_DNS_OR_IP}:${PROXY_PORT}
ServerBehindNAT = ${BEHIND_NAT}

[OAuth]
Server = ${EXTERNAL_DNS_OR_IP}
ServerBehindNAT = ${BEHIND_NAT}
EOF

docker build --tag=local/gcs-configured assets/Dockerfile

rm assets/globus-connect-server.conf

# globus-connect-server-setup
#service globus-gridftp-server start
#service myproxy-server start

# eval "cat <<EOF
# $(<globus-connect-server.conf.template)
# EOF
# " 2> /dev/null 1> globus-connect-server.conf


exit 0










