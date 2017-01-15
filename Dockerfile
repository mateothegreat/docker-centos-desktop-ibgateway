#
#
FROM appsoa/docker-centos-desktop-vnc:latest

USER root

COPY src/bin /bin
COPY src/home /home
COPY src/opt /opt

ADD https://storage.googleapis.com/algolab-container-resources/ibgateway.jars.tar /tmp/
RUN tar -xvzf /tmp/ibgateway.jars.tar -C /home/user/Jts/ibgateway/962

RUN chmod +x /etc/xdg/xfce4/xinitrc && \
    chmod 0 /usr/bin/xfce4-panel && \
    chown -R user:wheel /home/user /opt/IBController

EXPOSE 4100 5901

USER user
ENTRYPOINT ["/bin/ibgateway-settings.sh"]
