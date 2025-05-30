#!/bin/bash

# Generate SSH keys if not exists
if [ ! -f ~/.ssh/id_rsa ]; then
  mkdir -p ~/.ssh
  ssh-keygen -t rsa -b 3072 -f ~/.ssh/id_rsa -N ""
fi

# Start Upterm with correct flags
upterm host --server ssh://uptermd.upterm.dev:22 --accept --force-command 'tmux attach -t pair-programming || tmux new -s pair-programming'
