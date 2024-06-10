FROM debian:latest

LABEL maintainer "LJason <ljason@ljason77.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt -qq update && \
	apt install -yqq lib32gcc-s1 curl libcurl3-gnutls && \
	mkdir /Steam && cd $_ && \
	curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
	groupadd --gid 1000 pi && \
	useradd --uid 1000 --gid 1000 -m pi

USER pi

WORKDIR /Steam/DoNotStarveTogether/dontstarve/bin64

ENTRYPOINT ["./dontstarve_dedicated_server_nullrenderer_x64", "-persistent_storage_root", "/Steam"]