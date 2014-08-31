FROM fedora:20

RUN yum -y groupinstall \
    'Xfce Desktop' \
    ; yum clean all

# http://sigkillit.com/2013/02/26/how-to-remotely-access-linux-from-windows/
ADD Xclients /etc/skel/.Xclients

RUN yum -y install \
    scap-security-guide \
    scap-workbench \
    supervisor \
    xrdp \
    ; yum clean all

RUN useradd foo; \
    echo foo:bar | chpasswd

# Configure supervisord to run session manager and xrdp.
ADD xrdp.ini /etc/supervisord.d/

# Allow all users to connect via RDP.
RUN sed -i '/TerminalServerUsers/d' /etc/xrdp/sesman.ini; \
    sed -i '/TerminalServerAdmins/d' /etc/xrdp/sesman.ini

EXPOSE 3389
CMD ["supervisord", "-n"]
