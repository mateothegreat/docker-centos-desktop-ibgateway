#
#
FROM appsoa/docker-centos-desktop-vnc:testing

USER root

COPY src/bin /bin
COPY src/home /home
COPY src/opt /opt

COPY ibgateway.jars.tar /tmp
RUN tar -xvzf /tmp/ibgateway.jars.tar -C /home/user/Jts/ibgateway/962

RUN chmod +x /etc/xdg/xfce4/xinitrc && \
    chmod 0 /usr/bin/xfce4-panel && \
    chown -R user:wheel /home/user /opt/IBController

# IB TWS API Port
EXPOSE 4749

USER user
ENTRYPOINT ["/bin/ibgateway-settings.sh"]