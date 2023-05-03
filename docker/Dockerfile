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
COPY --from=base /tmp/ftbinstaller/server_installer /server_installer

ARG USER=ftb
ARG GROUP=ftb
ARG PUID=845
ARG PGID=845
ARG MOD_PACK_ID=''
ARG VERSION_ID='--latest'

RUN /server_installer ${MOD_PACK_ID} ${VERSION_ID} --path "/ftb" --auto

WORKDIR /ftb

RUN echo "eula=true" > eula.txt

RUN addgroup -g "$PGID" -S "$GROUP" \
    && adduser -u "$PUID" -D -G "$GROUP" "$USER" \
    && chown -R "$USER":"$GROUP" /ftb

EXPOSE 25565
VOLUME ["/ftb/world"]
USER "$USER"

CMD ["sh", "/ftb/start.sh"]
