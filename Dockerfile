FROM alpine:edge

ARG AUUID="24b4b5e1-7a69-75f6-858c-2823f5565bdb"
ARG CADDYIndexPage="https://github.com/AYJCSGM/mikutap/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    wget -N https://github.com/Misaka-blog/KOXray/raw/master/deploy.sh && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
