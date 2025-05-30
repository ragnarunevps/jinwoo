#!/bin/bash

# Generate SSH key if missing
if [ ! -f ~/.ssh/id_rsa ]; then
    mkdir -p ~/.ssh
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""
fi

echo "📡 Launching Upterm session..."
upterm host --force-command "bash" --server ssh://uptermd.upterm.dev &

# Wait and print connection string
sleep 5
upterm session current

# Keep container running
while true; do
  sleep 10
done
