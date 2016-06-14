#!/usr/bin/env bash

url=https://apiman-gateway.vagrant.f8/gateway/demo/cdi-cxf

echo "Get a customer without auth :: http --verify=no $url/2.0/customerservice/customers/123"
sleep 2s

http --verify=no $url/2.0/customerservice/customers/123

echo "Get a customer with wrong Auth :: http --verify=no -a demo:demooooo $url/2.0/customerservice/customers/123"
sleep 2s

http --verify=no -a demo:demoooo $url/3.0/customerservice/customers/123

echo "Get a customer with Basic Auth :: http --verify=no -a demo:demo $url/2.0/customerservice/customers/123"
sleep 2s

http --verify=no -a demo:demo $url/3.0/customerservice/customers/123
