#!/bin/bash

## Simple command
##
# python es_test_data.py --es_url=http://localhost:9200 --count=100 --index_name=fo-bar --num_of_shards=5 --num_of_replicas=1

ES_HOST="localhost"
ES_PORT="9200"

DOC_COUNT="1000"
NUM_SHARDS=2
NUM_REPLICAS=1

for i in $(seq 0 30); do
  date_str=$(gdate -d "2019-07-01 +$i days" +"%Y%m%d")
  idx_name="fluentd-foo-${date_str}"
  echo ";;; Writing to index: $idx_name"

  python es_test_data.py \
    --es_url=http://${ES_HOST}:${ES_PORT} \
    --count=${DOC_COUNT} \
    --index_name=${idx_name} \
    --num_of_shards=${NUM_SHARDS} \
    --num_of_replicas=${NUM_REPLICAS}

    echo ""
done
