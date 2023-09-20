FROM alpine:latest

RUN apk add git
RUN mkdir /app
COPY entrypoint-gitclone.sh /entrypoint-gitclone.sh

ENTRYPOINT ["sh" "/entrypoint-gitclone.sh"]

