#
# Dockerfile for redir
#

FROM alpine

MAINTAINER VyronLee <lwz_jz@hotmail.pro>

RUN apk add -U iproute2 && ln -s /usr/lib/tc /lib/tc

ENV LOCAL_ADDR 127.0.0.1
ENV LOCAL_PORT 80
ENV REMOTE_ADDR 8.8.8.8
ENV REMOTE_PORT 80

ENV RATE 12mbit
ENV BURST 12kb
ENV LATENCY 50ms
ENV INTERVAL 60

CMD iptables -t nat -A PREROUTING -p tcp --dport $LOCAL_PORT -j DNAT --to-destination $REMOTE_ADDR:$REMOTE_PORT \
    && iptables -t nat -A PREROUTING -p udp --dport $LOCAL_PORT -j DNAT --to-destination $REMOTE_ADDR:$REMOTE_PORT \
    && iptables -t nat -A POSTROUTING -p tcp -d $REMOTE_ADDR --dport $LOCAL_PORT -j SNAT --to-source $LOCAL_ADDR \
    && iptables -t nat -A POSTROUTING -p udp -d $REMOTE_ADDR --dport $LOCAL_PORT -j SNAT --to-source $LOCAL_ADDR \
    && tc qdisc add dev eth0 root tbf rate $RATE burst $BURST latency $LATENCY \
    && watch -n $INTERVAL tc -s qdisc ls dev eth0
