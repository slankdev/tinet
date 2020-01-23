
FROM slankdev/frr:centos-7-stable-7.0
MAINTAINER Hiroki Shirokura <slankdev@gmail.com>

ENV GOOGLE_URL https://storage.googleapis.com/etcd
ENV GITHUB_URL https://github.com/coreos/etcd/releases/download
ENV DOWNLOAD_URL ${GOOGLE_URL}
ENV ETCD_VER v3.2.21
ENV ETCDCTL_API 3

ADD ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz /tmp
RUN cd /tmp && tar xpf etcd-${ETCD_VER}-linux-amd64.tar.gz \
 && cp /tmp/etcd-${ETCD_VER}-linux-amd64/etcd /usr/bin \
 && cp /tmp/etcd-${ETCD_VER}-linux-amd64/etcdctl /usr/bin \
