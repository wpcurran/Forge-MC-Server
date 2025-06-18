#!/bin/bash

# Create a timestamp for the backup filename
DATE=$(date +'%Y-%m-%d_%H-%M-%S')

# Backup folder is RELATIVE to the repo (no hardcoding)
BACKUP_DIR="./backups"

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Create a compressed archive (.tar.gz) of the ./data folder
tar -czvf "$BACKUP_DIR/mc-backup-$DATE.tar.gz" ./data
