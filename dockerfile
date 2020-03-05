FROM centos:centos7
MAINTAINER 983052176@qq.com

RUN mkdir -p /opt/dm
RUN chmod -R 777 /opt/dm
ADD DMInstall.bin /opt/dm/DMInstall.bin
ADD install.sh /opt/dm/install.sh

CMD ["/opt/dm/install.sh"]
