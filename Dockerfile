FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && \
    apt-get install -y wget curl openssh-client tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Download and install Upterm prebuilt binary
RUN wget https://github.com/owenthereal/upterm/releases/download/v0.6.5/upterm-linux_amd64.tar.gz -O upterm.tar.gz && \
    mkdir -p upterm && \
    tar -xzf upterm.tar.gz -C upterm && \
    mv upterm/upterm /usr/local/bin/ && \
    chmod +x /usr/local/bin/upterm

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
