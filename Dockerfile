FROM node:lts-alpine

WORKDIR /app

# Install PHP
RUN apk add --no-cache \
    curl \
    php7 \
    php7-ast \
    php7-ctype \
    php7-gd \
    php7-json \
    php7-mbstring \
    php7-openssl \
    php7-phar \
    php7-phpdbg \
    php7-simplexml \
    php7-tokenizer \
    php7-xml \
    php7-xmlreader \
    php7-xmlwriter \
    php7-xsl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Libs required for Build and Deploy
RUN apk add --no-cache \
    autoconf \
    automake \
    bash \
    g++ \
    git \
    libc6-compat \
    libjpeg-turbo-dev \
    libpng-dev \
    libxslt-dev \
    make \
    openssh-client \
    rsync \
    sudo \
    zlib-dev \
    nasm \
    libtool

# Install WP Cli
RUN cd /usr/bin && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv /usr/bin/wp-cli.phar /usr/bin/wp && \
    chmod +x /usr/bin/wp
