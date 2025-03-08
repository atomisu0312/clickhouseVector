#!/bin/bash
TEST_A=$1

cat ./query/05_select_string_sample.sql | 
  sed "s/__VAR__/${TEST_A}/" |
  curl 'http://localhost:18123/?password=changeme' --data-binary @-