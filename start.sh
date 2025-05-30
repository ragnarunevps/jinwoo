#!/bin/bash

# Fail on error
set -e

# Setup known_hosts to skip "authenticity" prompt
mkdir -p ~/.ssh
ssh-keyscan -t ed25519 uptermd.upterm.dev >> ~/.ssh/known_hosts

# Generate SSH key if not present
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 3072 -f ~/.ssh/id_rsa -N ""
fi

# Start the upterm host session
upterm host --accept -- bash
