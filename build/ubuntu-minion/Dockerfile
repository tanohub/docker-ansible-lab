FROM ansible-ubuntu-base:latest
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
	sudo \
	openssh-server \
    && apt-get clean \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && rm -rf /var/lib/apt/lists/* \
    && touch -d "2 hours ago" /var/lib/apt/lists

ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/bin/bash", "/start.sh"]
