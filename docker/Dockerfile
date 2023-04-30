ARG IMAGE_VERSION=3.17
FROM alpine:${IMAGE_VERSION} as base

RUN apk update && apk upgrade && apk add wget

RUN mkdir -p /tmp/ftbinstaller
WORKDIR /tmp/ftbinstaller

RUN wget https://api.modpacks.ch/public/modpack/1/1/server/linux -O server_installer
RUN chmod +x /tmp/ftbinstaller/server_installer

ARG MOD_PACK_ID=''
ARG VERSION_ID='--latest'

RUN mkdir -p /ftb

RUN /tmp/ftbinstaller/server_installer ${MOD_PACK_ID} ${VERSION_ID} --path "/ftb" --auto

WORKDIR /ftb

RUN echo "eula=true" > eula.txt

EXPOSE 25565
VOLUME ["/ftb"]

CMD ["/ftb/start.sh"]