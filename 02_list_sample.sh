#!/bin/bash
INPUT=$1

tokens=$(curl -s -X 'POST' \
    "http://localhost:13000/tokenize" \
    -H "accept: text/plain" \
    -H "Content-Type: application/json" \
    -d "{
    \"text\": \"${INPUT}\"
}"  | jq -c | sed "s/\"/'/g")

# 改行をエスケープ

echo "$tokens"

cat ./query/06_select_list_template.sql | 
  sed "s/__VAR__/${tokens}/" |
  curl 'http://localhost:18123/?password=changeme' --data-binary @-