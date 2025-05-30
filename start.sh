#!/bin/bash

# Generate SSH keys if not present
if [ ! -f ~/.ssh/id_rsa ]; then
    mkdir -p ~/.ssh
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""
fi

echo "📡 Launching Upterm session..."
upterm host --force-command "bash" --server ssh://uptermd.upterm.dev &

# Wait a few seconds for session to establish
sleep 5

# Print SSH/Web URL
upterm session current

# Keep container alive
while true; do
  sleep 10
done
