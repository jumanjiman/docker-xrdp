FROM fedora:22

RUN dnf -y groupinstall \
    'Xfce Desktop' \
    && yum clean all

# http://sigkillit.com/2013/02/26/how-to-remotely-access-linux-from-windows/
COPY Xclients /etc/skel/.Xclients

RUN dnf -y install \
    scap-security-guide \
    scap-workbench \
    supervisor \
    xrdp \
    && dnf clean all

RUN useradd foo && \
    echo foo:bar | chpasswd

# Configure supervisord to run session manager and xrdp.
COPY xrdp.ini /etc/supervisord.d/

# Allow all users to connect via RDP.
RUN sed -i '/TerminalServerUsers/d' /etc/xrdp/sesman.ini && \
    sed -i '/TerminalServerAdmins/d' /etc/xrdp/sesman.ini

EXPOSE 3389
CMD ["supervisord", "-n"]
