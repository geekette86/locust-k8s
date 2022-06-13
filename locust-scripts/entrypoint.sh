#!/bin/bash

LOCUST_CMD="locust"
LOCUST_OPTIONS="-f /locust-scripts/locust_file.py --host=$LOCUST_TARGET_HOST"
LOCUST_MODE=${LOCUST_MODE:-standalone}

if [[ "$LOCUST_MODE" = "master" ]]; then
    LOCUS_OPTIONS="$LOCUST_OPTIONS --master"
elif [[ "$LOCUST_MODE" = "worker" ]]; then
    LOCUST_OPTIONS="$LOCUST_OPTIONS --slave --master-host=$LOCUST_MASTER"
fi

echo "$LOCUST_CMD $LOCUST_OPTIONS"
$LOCUST_CMD $LOCUST_OPTIONS