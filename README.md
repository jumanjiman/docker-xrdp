XFCE in a Fedora Docker container
=================================

What
----

Simple proof of concept to run Fedora 22 desktop in a container.


Why
---

I want to run a graphical Linux app, such as `scap-workbench`,
and access it from devices that cannot run an X Server,
such as a stock Chromebook or Windows laptop.

I may extend https://github.com/jumanjiman/wormhole to provide
a full desktop along the lines of xrdp.


Run
---

On a Linux host with Docker:

    # Vanilla desktop.
    # This is really meant to be a base image for others.
    docker run -d -p 3389:3389 jumanjiman/xrdp

    # Or desktop with SCAP workbench.
    docker run -d -p 3389:3389 jumanjiman/scap-workbench

Connect to the container as user `foo` with password `bar`
via an RDP client.


Build
-----

On a Linux host with Docker 1.6 or higher:

    docker build --rm -t jumanjiman/xrdp-fedora -f Dockerfile.xrdp-fedora .
    docker build --rm -t jumanjiman/xrdp -f Dockerfile.apps .
