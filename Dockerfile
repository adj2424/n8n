FROM n8nio/n8n:latest

USER root

# Dynamically detect architecture (x86_64 for Intel, aarch64 for Apple Silicon) 
# and download the matching version of apk-tools
RUN ARCH=$(uname -m) && \
    wget -q "https://dl-cdn.alpinelinux.org/alpine/v3.22/main/${ARCH}/apk-tools-2.14.9-r3.apk" && \
    tar -xzf apk-tools-2.14.9-r3.apk -C / && \
    rm apk-tools-2.14.9-r3.apk

RUN apk update && apk add --no-cache ffmpeg

# Create the directory for file access and set permissions
RUN mkdir -p /home/node/.n8n-files && chown node:node /home/node/.n8n-files

USER node