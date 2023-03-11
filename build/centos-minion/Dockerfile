FROM centos:7

RUN yum clean all && \
	yum -y update && \
	yum -y install openssh-server nano python3

ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]
