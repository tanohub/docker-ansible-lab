FROM ansible-ubuntu-base:latest

# install ansible package
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
	ansible \
        git \
	openssh-server \
	openssh-client

ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/bin/bash", "/start.sh"]
