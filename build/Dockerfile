FROM ubuntu:focal
COPY scripts /opt/rsc/scripts
EXPOSE 514 443 80
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN apt-get update \
    && \
    apt-get install -y \
    tzdata \
    iproute2 \
    git \
    lsb-release \
    apt-transport-https \
    && \
    mkdir -p /opt/rsc/data\
    && \
    cd /opt/rsc \
    && \
    git clone https://github.com/tslenter/RSX-RSC.git \
    && \
    cd RSX-RSC \
    && \
    chmod +x rsinstaller \
    && \
    cp rsinstaller rsinstaller.backup \
    && \
    sed -i 's/select opt in .*/for opt in "Core installation"/' ./rsinstaller \
    && \
    ./rsinstaller \
    && \
    cp rsinstaller.backup rsinstaller \
    && \
    sed -i 's/select opt in .*/for opt in "Install RSC"/' ./rsinstaller \
    && \
    ./rsinstaller \
    && \
    cp rsinstaller.backup rsinstaller \
    && \
    useradd -s /bin/bash -m -p '$2y$10$oi1YVvzf/VWdLuwelrDZfu.dbdo3CIFZB0TBUy7K48IGiZRhHQvK6' -d /home/admin admin \
# password is admin
    && \
    apt-get remove -y \
    git \
    lsb-release \
    apt-transport-https \
    && \
    apt-get clean \
    && \
    apt-get autoremove -y \
    && \
    ln -s /var/log/remote_syslog/ /opt/rsc/data/
# then navigate to http://localhost
# log in with admin admin
# test by sending a command like `logger -n 172.17.0.2 "test message"
WORKDIR /opt/rsc/RSX-RSC
CMD ["/opt/rsc/scripts/startup.sh"]

# commands referenced from: <https://github.com/tslenter/RSX-RSC/>
