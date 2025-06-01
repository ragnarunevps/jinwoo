FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and set timezone
RUN apt-get update && \
    apt-get install -y tmate tzdata expect && \
    ln -sf /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run script on container start
CMD ["/start.sh"]
