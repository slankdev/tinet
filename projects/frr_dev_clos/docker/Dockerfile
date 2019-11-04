FROM fedora:24
RUN dnf remove -y vim-minimal \
 && dnf install -y wget vim git autoconf automake libtool make \
    readline-devel texinfo net-snmp-devel groff pkgconfig json-c-devel \
    pam-devel python3-pytest bison flex c-ares-devel python3-devel \
    python3-sphinx perl-core patch systemd-devel libcap-devel \
    python python-devel python-sphinx rpm-build

ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-24-x86_64-Packages/libyang-0.16.111-0.x86_64.rpm /tmp/
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-24-x86_64-Packages/libyang-debuginfo-0.16.111-0.x86_64.rpm /tmp/
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-24-x86_64-Packages/libyang-devel-0.16.111-0.x86_64.rpm /tmp
RUN dnf install -y /tmp/*.rpm

RUN git clone https://github.com/frrouting/frr.git frr && cd frr \
 && ./bootstrap.sh && ./configure --with-pkg-extra-version=-slankdev \
 && make dist && mkdir rpmbuild && mkdir rpmbuild/SOURCES \
 && mkdir rpmbuild/SPECS && cp redhat/*.spec rpmbuild/SPECS/ \
 && cp frr*.tar.gz rpmbuild/SOURCES/

COPY frr.spec /frr/rpmbuild/SPECS/frr.spec
RUN cd /frr && rpmbuild --define "_topdir `pwd`/rpmbuild" -ba rpmbuild/SPECS/frr.spec
