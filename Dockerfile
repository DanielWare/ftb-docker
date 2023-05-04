ARG IMAGE_VERSION=3.17
FROM alpine:${IMAGE_VERSION} as base

RUN apk update && apk upgrade && apk add wget

RUN mkdir -p /tmp/ftbinstaller
WORKDIR /tmp/ftbinstaller

RUN wget https://api.modpacks.ch/public/modpack/1/1/server/linux -O server_installer
RUN chmod +x /tmp/ftbinstaller/server_installer


RUN mkdir -p /ftb
RUN chmod ugo=rwx /ftb

FROM alpine:${IMAGE_VERSION} as final
RUN mkdir -p /ftb
COPY --from=base /tmp/ftbinstaller/server_installer /ftb/server_installer
COPY ./entrypoint.sh /entrypoint.sh
WORKDIR /ftb

ARG USER=ftb
ARG GROUP=ftb
ARG PUID=845
ARG PGID=845

ENV MOD_PACK_ID=''
ENV VERSION_ID='--latest'

RUN echo "eula=true" > eula.txt

RUN addgroup -g "$PGID" -S "$GROUP" \
    && adduser -u "$PUID" -D -G "$GROUP" "$USER" \
    && chown -R "$USER":"$GROUP" /ftb \
    && chown "$USER":"$GROUP" /entrypoint.sh \
    && chmod +x /entrypoint.sh

EXPOSE 25565
USER "$USER"

ENTRYPOINT ["/entrypoint.sh"]
