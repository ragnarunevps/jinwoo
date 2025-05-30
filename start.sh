#!/bin/bash

# Install upterm (if not already included in Docker image)
curl -s https://api.github.com/repos/owenthereal/upterm/releases/latest \
| grep "browser_download_url.*linux_amd64\.tar\.gz" \
| cut -d '"' -f 4 \
| wget -qi - -O upterm.tar.gz

mkdir -p upterm
tar -xzf upterm.tar.gz -C upterm
mv upterm/upterm /usr/local/bin/

# Generate SSH keys if not exists
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""
fi

# Start Upterm session
upterm host --force-command "bash" --server ssh://uptermd.upterm.dev
