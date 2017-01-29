#
#
FROM appsoa/docker-centos-desktop-vnc:latest
MAINTAINER Matthew Davis <matthew@appsoa.io>

USER root
ENV INSTALL4J_JAVA_HOME=/usr/java/jdk1.8.0_60 \
    TZ=America/Phoenix

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

COPY src/bin /bin
COPY src/home /home
COPY src/opt /opt

ADD https://storage.googleapis.com/algolab-container-resources/ibgateway.jars.tar /tmp/
RUN tar -xvzf /tmp/ibgateway.jars.tar -C /home/user/Jts/ibgateway/962

RUN yum -y install nc && \
    chown -R user.wheel /home/user /opt/IBController

EXPOSE 4100 5902 4440 6906

COPY src/entrypoint.sh /
COPY src/entrypoint.d/* /entrypoint.d/
ONBUILD COPY src/entrypoint.d/* /entrypoint.d/

USER user
ENTRYPOINT ["/entrypoint.sh"]