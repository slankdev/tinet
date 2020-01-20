
FROM slankdev/docker-ubuntu
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

# (base=slankdev/ubuntu:16.04) install libcuishark
RUN git clone http://github.com/cuishark/libcuishark $HOME/libcuishark \
 && cd $HOME/libcuishark && ./bootstrap.sh && make && make install

# install cuishark
RUN go get github.com/cuishark/cuishark \
 && cd $GOPATH/src/github.com/cuishark/cuishark/cgocuishark && go install \
 && cd $GOPATH/src/github.com/cuishark/cuishark/cuishark && go install \
 && cp $GOPATH/bin/cuishark /usr/local/bin


