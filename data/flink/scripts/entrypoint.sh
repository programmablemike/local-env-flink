#!/bin/bash
# Start the Flink cluster
# By default, Flink will overwrite the flink-conf.yaml file with its own values. This is undesirable so we copy the file first to avoid this.
set -e

# Copy flink-conf.yaml from a mounted volume if it doesn't exist or is outdated
if [ -f /opt/flink/conf/flink-conf.yaml ]; then
  echo "Using provided flink-conf.yaml"
else
  cp /mounted/config/flink-conf.yaml /opt/flink/conf/
fi

# Decide whether to run JobManager or TaskManager
if [[ "$1" == "jobmanager" ]]; then
  echo "Starting Flink JobManager..."
  exec /opt/flink/bin/jobmanager.sh start-foreground
elif [[ "$1" == "taskmanager" ]]; then
  echo "Starting Flink TaskManager..."
  exec /opt/flink/bin/taskmanager.sh start-foreground
else
  echo "Unknown argument: $1"
  exit 1
fi
