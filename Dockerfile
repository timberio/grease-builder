FROM golang:1.8.3
MAINTAINER David Antaramian <david@timber.io>
ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y \
  git \
  make \
  sed \
  openssh-client \
  openssh-server \
  tar

RUN curl -fsSL https://github.com/timberio/grease/releases/download/v1.0.0/grease-1.0.0-linux-amd64.tar.gz -o /tmp/grease.tar.gz \
  && tar -xzf /tmp/grease.tar.gz -C /tmp \
  && mv /tmp/grease/bin/grease /usr/bin/grease \
  && chown root:root /usr/bin/grease \
  && rm /tmp/grease.tar.gz \
  && rm -r /tmp/grease

RUN go get github.com/mitchellh/gox
RUN go get github.com/jstemmer/go-junit-report

LABEL io.timber.golang=1.8.3 io.timber.grease=1.0.0
