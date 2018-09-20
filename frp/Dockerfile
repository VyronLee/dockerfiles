#
# Dockerfile for frp
#
FROM golang:alpine

MAINTAINER VyronLee <lwz_jz@hotmail.pro>

ENV FRP_VER 0.21.0
ENV FRP_URL https://github.com/fatedier/frp/archive/v$FRP_VER.tar.gz
ENV FRP_DIR frp-$FRP_VER
ENV FRP_BUILD_DIR /go/src/github.com/fatedier

RUN apk add --no-cache --virtual TMP \
        curl \
        tar \
        make

RUN curl -sSL $FRP_URL | tar xz \
        && mkdir -p $FRP_BUILD_DIR \
        && mv $FRP_DIR $FRP_BUILD_DIR/frp \
        && cd $FRP_BUILD_DIR/frp \
            && make \
            && mv bin/frps /usr/bin/frps \
            && mv bin/frpc /usr/bin/frpc \
        && rm -rf $FRP_BUILD_DIR \
        && apk del TMP

EXPOSE 80 443 6000 7000 7500
