FROM debian:bullseye-slim

ARG REGION=ap
ENV DEBIAN_FRONTEND=noninteractive

# Install paket yang diperlukan
RUN apt update && apt upgrade -y && \
    apt install -y --no-install-recommends \
    wget gcc curl python3 python3-pip python3-tk python3-dev sudo git dbus-x11 xfce4 xfce4-terminal \
    xvfb xserver-xorg-video-dummy xbase-clients python3-packaging python3-psutil python3-xdg tmate firefox-esr && \
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb && \
    dpkg -i chrome-remote-desktop_current_amd64.deb || apt install --assume-yes --fix-broken && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* chrome-remote-desktop_current_amd64.deb

# Membuat pengguna baru dan menyiapkan lingkungan
RUN useradd -m coder && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir -p /home/coder/project

# Instal Python venv
RUN apt install -y python3-venv && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /home/coder/project

# Copy dan siapkan start script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expose port 8080
EXPOSE 8080

# Start the services
CMD ["/usr/local/bin/start.sh"]
