#!/bin/bash
INPUT=$1

tokens=$(curl -s -X 'POST' \
    "http://localhost:13000/get_embeddings" \
    -H "accept: text/plain" \
    -H "Content-Type: application/json" \
    -d "{
    \"text\": \"${INPUT}\"
}")


cat ./query/08_select_semtantic_template.sql | 
  sed "s/__VAR__/${tokens}/" |
  curl 'http://localhost:18123/?password=changeme' --data-binary @-