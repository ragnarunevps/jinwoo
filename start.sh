#!/bin/bash

set -e

# Setup ~/.ssh directory
mkdir -p ~/.ssh

# Add uptermd fingerprint to known_hosts so no prompt happens
ssh-keyscan -t ed25519 uptermd.upterm.dev >> ~/.ssh/known_hosts

# Generate SSH key if not already present
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 3072 -f ~/.ssh/id_rsa -N ""
fi

# Show public key (for debugging or manual SSH auth if needed)
echo "==== Public Key ===="
cat ~/.ssh/id_rsa.pub
echo "===================="

# Host the upterm session with auto accept
upterm host --accept --server ssh://uptermd.upterm.dev:22 -- bash
