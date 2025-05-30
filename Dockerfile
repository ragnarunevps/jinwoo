FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    openssh-client \
    git \
    tmux \
    ca-certificates \
    && apt-get clean

# Install Upterm manually from fixed working .deb
RUN curl -L -o upterm.deb https://github.com/owenthereal/upterm/releases/download/v0.10.0/upterm_0.10.0_linux_amd64.deb && \
    dpkg -i upterm.deb && \
    rm upterm.deb

# Add script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
