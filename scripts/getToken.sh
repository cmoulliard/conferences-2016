#!/usr/bin/env bash

# Locally

#host=http://localhost:8080
#host=https://192.168.1.80:8443
#host=https:localhost//:8443

# Host deployed in Openshift
host=https://keycloak.vagrant.f8

#auth_result=$(http --verify=no --verbose -f $HOST/auth/realms/demo/protocol/openid-connect/token username=admin password=admin grant_type=password client_id=demo)
auth_result=$(curl -sk -X POST $HOST/auth/realms/demo/protocol/openid-connect/token -d grant_type=password -d username=admin -d password=admin -d grant_type=password -d client_id=demo)
access_token=$(echo -e "$auth_result" | awk -F"," '{print $1}' | awk -F":" '{print $2}' | sed s/\"//g | tr -d ' ')

echo $access_token

url=https://apiman-gateway.vagrant.f8/gateway/default/cdi-cxf/4.0
get=customerservice/customers/123

#echo $access_token

echo "Get Customer !!!"
#curl -k -H "Accept: application/xml" -H "Content-Type: application/xml" -X GET $url/$get -H "Authorization: Bearer $access_token"

http --verify=no GET $url/$get "Authorization: Bearer $access_token"