FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
  curl \
  openssh-client \
  tmux \
  git \
  ca-certificates \
  && apt-get clean

# Install upterm
RUN curl -s https://api.github.com/repos/owenthereal/upterm/releases/latest \
  | grep "browser_download_url.*linux_amd64\.deb" \
  | cut -d '"' -f 4 \
  | xargs curl -L -o upterm.deb \
  && dpkg -i upterm.deb \
  && rm upterm.deb

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Default command
CMD ["/start.sh"]
