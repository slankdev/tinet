
FROM slankdev/ubuntu:18.04-tmp
MAINTAINER Hiroki Shirokura <slankdev@coe.ad.jp>

# (Add util)
ADD ./enable_seg6_router.py /usr/bin/enable_seg6_router.py
ADD ./disable_seg6_router.py /usr/bin/disable_seg6_router.py
RUN chmod +x /usr/bin/enable_seg6_router.py
RUN chmod +x /usr/bin/disable_seg6_router.py

# (base=slankdev/ubuntu18:04) basic package install
RUN sh -c "curl -s https://packagecloud.io/install/repositories/fdio/1904/script.deb.sh | sudo bash" \
 && apt install -y vpp
ADD ./startup.conf /etc/vpp/startup.conf
ADD ./exec.vpp /etc/vpp/exec.vpp
