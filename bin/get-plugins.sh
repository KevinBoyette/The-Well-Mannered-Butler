#!/bin/bash
curl -s -k "http://admin:admin@localhost:8080/pluginManager/api/json?depth=1" \
  | jq -r '.plugins[].shortName' | tee plugins.txt
