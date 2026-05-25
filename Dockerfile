FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Reinstall apk-tools first because it is missing in the base image
RUN wget -q https://dl-cdn.alpinelinux.org/alpine/v3.22/main/x86_64/apk-tools-2.14.9-r3.apk && \
    tar -xzf apk-tools-2.14.9-r3.apk -C / && \
    rm apk-tools-2.14.9-r3.apk

RUN apk update && apk add --no-cache ffmpeg

USER node