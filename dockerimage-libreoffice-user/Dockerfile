FROM lobase-bionic:latest

MAINTAINER Stefan Weiberg <stefan.weiberg@suse.com>

# gosu is necessary to switch UID and GID in entrypoint.sh
RUN apt-get update && apt-get -y install gosu \
&& rm -rf /var/lib/apt/lists/*

# set different entrypoint to support UID and GID mapping via environment variable
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
