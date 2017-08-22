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

RUN go get github.com/mitchellh/gox
RUN go get github.com/jstemmer/go-junit-report

LABEL io.timber.golang-version=1.8.3
