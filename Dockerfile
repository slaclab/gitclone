FROM alpine:latest

RUN apk add git
RUN mkdir /app
RUN ln -sf /tmp/.gitconfig /.gitconfig
COPY entrypoint-gitclone.sh /entrypoint-gitclone.sh

ENTRYPOINT ["sh", "/entrypoint-gitclone.sh"]

