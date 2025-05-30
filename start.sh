#!/bin/bash

# Generate SSH keys if not already present
if [ ! -f ~/.ssh/id_rsa ]; then
  mkdir -p ~/.ssh
  ssh-keygen -t rsa -b 3072 -f ~/.ssh/id_rsa -N ""
fi

# Start Upterm session
upterm host \
  --accept \
  --server ssh://uptermd.upterm.dev:22 \
  --force-command "tmux attach -t pair || tmux new -s pair" \
  -- tmux new -s pair
