#!/bin/bash
set -euo pipefail

source /etc/slack/secrets.env

# Find all containers that start with "runner-"
CONTAINER_NAMES=$(docker ps --filter "name=runner-" --format "{{.Names}}")

# Exit silently if no containers are found
[ -z "$CONTAINER_NAMES" ] && exit 0

HOSTNAME=$(hostname)
XH="/home/linuxbrew/.linuxbrew/bin/xh"

# Process each container
while IFS= read -r CONTAINER_NAME; do
  # Extract UUID from container name
  UUID=${CONTAINER_NAME#runner-}
  DOCKER_DIR="/tmp/$UUID/docker"

  # If the directory exists and is empty, clean up and restart
  # https://jira.atlassian.com/browse/BCLOUD-22851
  if [ -d "$DOCKER_DIR" ] && [ -z "$(ls -A "$DOCKER_DIR")" ]; then
    echo "=== $(date '+%F %T') ==="
    echo "Empty directory detected: $DOCKER_DIR"
    echo "Restarting container: $CONTAINER_NAME"

    $XH --ignore-stdin POST "$SLACK_WEBHOOK_URL" message="Found empty docker dir for ${CONTAINER_NAME} on ${HOSTNAME}. Fixing"
    rm -rf "$DOCKER_DIR"
    docker restart "$CONTAINER_NAME"
  fi
done <<< "$CONTAINER_NAMES"
