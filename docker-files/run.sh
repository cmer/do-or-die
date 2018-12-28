#!/bin/sh
CONFIG="${CONFIG:-config.yml}"

cd /app
git pull > /dev/null
bundle > /dev/null

echo "Starting Do-Or-Die..."
echo "Config: /config/$CONFIG"
./do-or-die --config /config/$CONFIG
