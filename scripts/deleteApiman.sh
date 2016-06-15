#!/usr/bin/env bash

dir="$PWD"

# Import util functions sch login
. $dir/util.sh

# Check if we are connected
oc whoami > /dev/null
if [ $? == 1 ]; then
  echo "Not logged in. We will try to log ..."
  openshiftLogin
fi

# Delete pods, rc, services, routes, secrets
oc delete pod,service,rc -l 'project in (apiman,apiman-gateway,elasticsearch-v1)'
oc delete route apiman apiman-gateway elasticsearch
oc delete secret apiman-gateway-keystore apiman-keystore elasticsearch-v1-keystore





