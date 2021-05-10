#!/bin/bash
set -e

redis_hostname=${REDIS_HOSTNAME:-"localhost"}
redis_port=${REDIS_PORT:-"6379"}

s3_bucket_name=${S3_BUCKET_NAME:-"binded-backups"}

datestr=$(date +%Y%m%d%H%M)

# just for testing...
# redis-server > /dev/null &
# while ! redis-cli ping; do sleep 1; done;
redis_extra=${REDIS_EXTRA:-""}

redis-cli \
-h "$redis_hostname" \
-p "$redis_port" \
--rdb /tmp/dump.rdb $redis_extra

aws s3 cp /tmp/dump.rdb "s3://${s3_bucket_name}/${datestr}-redis-backup.rdb" --endpoint $S3_ENDPOINT