#!/usr/bin/env bash

#host=http://localhost:8080
#host=https://192.168.1.80:8443
host=https://localhost:8443

auth_result=$(curl -k -X POST $host/auth/realms/demo/protocol/openid-connect/token -d grant_type=password -d username=reader -d password=reader -d client_id=demo)
access_token=$(echo -e "$auth_result" | awk -F"," '{print $1}' | awk -F":" '{print $2}' | sed s/\"//g | tr -d ' ')

echo $access_token

url=https://apiman-gateway.vagrant.f8/gateway/default/cdi-cxf/5.0
get=customerservice/customers/123

#echo $access_token

echo "Get Customer !!!"
#curl -k -H "Accept: application/xml" -H "Content-Type: application/xml" -X GET $url/$get -H "Authorization: Bearer $access_token"

http --verify=no GET $url/$get "Authorization: Bearer $access_token"