FROM ubuntu:18.04

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
    gnupg2 \
  ;

COPY dist/etc/apt/sources.list /etc/apt/sources.list

RUN set -eux; \
  export DEBIAN_FRONTEND=noninteractive; \
  ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7EA0A9C3F273FCD8; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		software-properties-common \
  ; \
  add-apt-repository ppa:ondrej/php; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    php7.4 \
    composer \
  ;
