FROM ruby:2.5.2-alpine3.7
LABEL maintainer="Carl Mercier <foss@carlmercier.com>"

ENV CONFIG="config.yml"

WORKDIR /app
VOLUME /config

COPY ["docker-files/run.sh", "/usr/local/bin/"]

RUN bundle config --global frozen 1 && \
    apk update && \
    apk add --update git nodejs nodejs-npm dumb-init && \
    npm install -g tplink-smarthome-api && \
    rm -rf /var/cache/apk/* && \
    git clone https://github.com/cmer/do-or-die.git /app && \
    cd /app && bundle

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/run.sh"]