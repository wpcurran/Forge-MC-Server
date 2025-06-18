#!/bin/bash

# Go to your repo directory
cd /home/liam/vanilla-mc-server/Vanilla-MC-Server || exit 1

# Pull latest changes from GitHub
git pull

# Make sure backup.sh is executable
chmod +x backup.sh

# Run the backup
./backup.sh
