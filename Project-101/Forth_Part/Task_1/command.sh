#!/bin/bash

sed -i "s/ec2-private_ip/$(grep "PrivateIpAddress" info.json | head -1 | cut -d'"' -f 4)/g" terraform.tf