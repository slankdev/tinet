
FROM slankdev/ubuntu:18.04-tmp
MAINTAINER Hiroki Shirokura <slankdev@coe.ad.jp>
WORKDIR /root
SHELL ["/bin/bash", "-c"]

# (base=slankdev/ubuntu18:04) basic package install
RUN apt update && apt install -y python3 virtualenv \
 && git clone https://github.com/brunorijsman/rift-python \
 && cd rift-python && git checkout -b 4b84c137467 4b84c137467 \
 && virtualenv env --python=python3 && source env/bin/activate \
 && pip install -r requirements.txt \
 && sh -c 'echo source $HOME/rift-python/env/bin/activate >> $HOME/.bashrc'

