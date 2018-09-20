#
# Dockerfile for gost
#

FROM golang:alpine

MAINTAINER VyronLee <lwz_jz@hotmail.com>

ENV GOST_VER 2.5
ENV GOST_URL https://github.com/ginuerzh/gost/archive/v$GOST_VER.tar.gz
ENV GOST_DIR gost-$GOST_VER
ENV GOST_BUILD_DIR /go/src/github.com/ginuerzh

RUN apk add --no-cache --virtual TMP \
        curl \
        tar

RUN curl -sSL $GOST_URL | tar xz \
    && mkdir -p $GOST_BUILD_DIR\
    && mv $GOST_DIR $GOST_BUILD_DIR/gost \
    && cd $GOST_BUILD_DIR/gost/cmd/gost \
        && go build -o gost \
        && mv gost /usr/bin/gost \
    && apk del TMP

ENTRYPOINT ["/usr/bin/gost"]


