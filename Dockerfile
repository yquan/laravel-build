FROM ubuntu:18.04

RUN set -eux; \
  export DEBIAN_FRONTEND=noninteractive; \
  ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    gnupg2 \
    curl \
  ; \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7EA0A9C3F273FCD8; \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list; \
  curl -sL https://deb.nodesource.com/setup_12.x | bash -; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
    ca-certificates \
    gnupg2 \
		software-properties-common \
  ; \
  add-apt-repository ppa:ondrej/php; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    php7.4 \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    php-xdebug \
    composer \
    nodejs \
    yarn \
    rsync \
    openssh-client \
  ;

COPY dist/etc/apt/sources.list /etc/apt/sources.list
