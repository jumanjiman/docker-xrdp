XFCE in a Docker container
==========================

What
----

Simple proof of concept to run a Linux desktop in a container.


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

    # Alpine desktop.
    # This is really meant to be a base image for others.
    docker run -d -p 3389:3389 jumanjiman/xrdp:alpine

    # Fedora desktop.
    # This is really meant to be a base image for others.
    docker run -d -p 3389:3389 jumanjiman/xrdp

    # Or desktop with SCAP workbench.
    docker run -d -p 3389:3389 jumanjiman/xrdp:openscap

Connect to the container as user `foo` with password `bar`
via an RDP client.

On a Windows host with Docker:

    # Alpine desktop.
    # This is really meant to be a base image for others.
    docker run -d -p 4000:3389 jumanjiman/xrdp:alpine

    # Fedora desktop.
    # This is really meant to be a base image for others.
    docker run -d -p 4000:3389 jumanjiman/xrdp

    # Or desktop with SCAP workbench.
    docker run -d -p 4000:3389 jumanjiman/xrdp:openscap

Connect to the container as user `foo` with password `bar`
via an RDP client to localhost:4000
(Note that you may be able to just follow the Linux instructions, but at least some versions of Windows have Remote Assitance / Remote Desktop already listening on port 3389)


Build
-----

On a Linux host with Docker and Docker Compose:

    ci/build
