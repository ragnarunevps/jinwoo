#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Set timezone
ln -sf /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Start tmate session
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

# Print SSH and Web URLs
echo "===================="
echo "💻 SSH access:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

echo "🌐 Web access (read-write):"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'
echo "===================="

# Keep container running forever
tail -f /dev/null
