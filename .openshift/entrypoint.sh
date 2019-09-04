#!/bin/sh

REDIS_HOST=$(eval echo \$REDIS_${DEPL_ID^^}_SERVICE_HOST)
REDIS_PORT=$(eval echo \$REDIS_${DEPL_ID^^}_SERVICE_PORT)
REDIS_PASS="$REDIS_PASSWORD"
export REDIS_HOST REDIS_PORT REDIS_PASS

pm2 start -x `which ethercalc` -- --cors && pm2 logs
