#!/bin/bash

## Simple command
##
# python es_test_data.py --es_url=http://localhost:9200 --count=100 --index_name=fo-bar --num_of_shards=5 --num_of_replicas=1

SERVICE_URI=""
USER=""
PWD=""

DOC_COUNT="1000"
NUM_SHARDS=1
NUM_REPLICAS=1

for i in $(seq 0 1); do
  date_str=$(date -d "2022-01-23 +$i days" +"%Y%m%d")
  idx_name="foo-${date_str}"
  echo ";;; Writing to index: $idx_name"

  python ./elasticsearch-test-data/es_test_data.py \
    --es_url=${SERVICE_URI} \
    --username=${USER} \
    --password=${PWD} \
    --count=${DOC_COUNT} \
    --index_name=${idx_name} \
    --num_of_shards=${NUM_SHARDS} \
    --num_of_replicas=${NUM_REPLICAS}

    echo ""
done
