FROM centos:6

MAINTAINER MUSTOFA <mustopainfo@gmail.com>

RUN yum install -y wget perl iputils && \
    wget http://software.virtualmin.com/gpl/scripts/install.sh && \
    yum clean all

RUN sh install.sh -f --hostname $(hostname -f).local.domain && \
    yum clean all

RUN printf admin\\nadmin\\n | passwd

EXPOSE 22 25 10000 10001 10002 10003 10004 10005 10006 10007 10008 10009 20000
EXPOSE 80 443 21 20 110 143
EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/bin/bash", "-c", "/etc/webmin/start && tail -f /var/webmin/webmin.log"]
