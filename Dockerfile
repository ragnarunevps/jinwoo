FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget curl git openssh-client golang tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Set Go env path (default Go install path)
ENV PATH="/root/go/bin:$PATH"

# Build Upterm from source
RUN git clone https://github.com/owenthereal/upterm.git && \
    cd upterm && \
    go install ./cmd/upterm/...

# Copy and make startup script executable
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
