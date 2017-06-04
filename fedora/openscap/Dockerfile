FROM jumanjiman/xrdp:fedora

RUN dnf -y install \
    scap-security-guide \
    scap-workbench \
    && dnf clean all

ARG CI_BUILD_URL
ARG BUILD_DATE
ARG VCS_REF

LABEL \
    io.github.jumanjiman.ci-build-url=${CI_BUILD_URL} \
    io.github.jumanjiman.build-date=${BUILD_DATE} \
    io.github.jumanjiman.vcs-ref=${VCS_REF} \
    io.github.jumanjiman.version="Fedora" \
    io.github.jumanjiman.license="GPL v3" \
    io.github.jumanjiman.docker.dockerfile="/fedora/openscap/Dockerfile" \
    io.github.jumanjiman.vcs-type="Git" \
    io.github.jumanjiman.vcs-url="https://github.com/jumanjiman/docker-xrdp.git"
