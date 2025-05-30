FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    openssh-client \
    git \
    tmux \
    ca-certificates \
    && apt-get clean

# Install Upterm (latest release)
RUN curl -s https://api.github.com/repos/owenthereal/upterm/releases/latest \
  | grep "browser_download_url.*linux_amd64.deb" \
  | cut -d '"' -f 4 \
  | xargs curl -L -o upterm.deb && \
  dpkg -i upterm.deb && \
  rm upterm.deb

# Add script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start session
CMD ["/start.sh"]
