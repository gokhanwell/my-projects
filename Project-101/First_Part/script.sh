#!/bin/bash

cat event_history.csv | grep -i "serdar" | grep -i "terminate" | grep -Eo "i-.{17}" | sort | uniq | tee result.txt