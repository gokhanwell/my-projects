#!/bin/bash

cat auth.log | grep "Failed password for invalid user" | awk '{print $11}' | sort | uniq -c | tee result.txt