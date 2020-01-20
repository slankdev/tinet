
FROM slankdev/ubuntu:18.04
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

# (base=slankdev/ubuntu18:04) basic package install
ADD https://raw.githubusercontent.com/osrg/gobgp/master/tools/completion/gobgp-static-completion.bash /etc/bash_completion.d/
ADD https://raw.githubusercontent.com/osrg/gobgp/master/tools/completion/gobgp-dynamic-completion.bash /etc/bash_completion.d/
ADD https://raw.githubusercontent.com/osrg/gobgp/master/tools/completion/gobgp-completion.bash /etc/bash_completion.d/
ADD https://github.com/osrg/gobgp/releases/download/v2.6.0/gobgp_2.6.0_linux_amd64.tar.gz /gobgp.tgz
RUN tar xpf /gobgp.tgz \
 && mv gobgp gobgpd /usr/bin

# (Add util)
ADD ./enable_seg6_router.py /usr/bin/enable_seg6_router.py
ADD ./disable_seg6_router.py /usr/bin/disable_seg6_router.py
RUN chmod +x /usr/bin/enable_seg6_router.py
RUN chmod +x /usr/bin/disable_seg6_router.py

