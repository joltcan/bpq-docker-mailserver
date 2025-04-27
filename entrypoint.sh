#!/bin/bash

TARGET_DIR=/config
TARGET_USER=linbpq

# Only chown if needed
if [ "$(stat -c %u "$TARGET_DIR")" != "$(id -u $TARGET_USER)" ]; then
    echo "Fixing permissions on $TARGET_DIR..."
    chown -R ${TARGET_USER}:${TARGET_USER} "$TARGET_DIR"
fi

# Drop privileges
exec gosu ${TARGET_USER} "$@"
