FROM node:lts-alpine3.20

WORKDIR /app

# Install PHP
RUN apk add --no-cache \
    curl \
    jq \
    php83 \
    php83-ctype \
    php83-gd \
    php83-json \
    php83-mbstring \
    php83-openssl \
    php83-phar \
    php83-phpdbg \
    php83-simplexml \
    php83-tokenizer \
    php83-xml \
    php83-xmlreader \
    php83-xmlwriter \
    php83-xsl

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

# Install Python 3
ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache python3 py3-pip py3-setuptools
RUN mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/EXTERNALLY-MANAGED.old

# Install WP Cli
RUN cd /usr/bin && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv /usr/bin/wp-cli.phar /usr/bin/wp && \
    chmod +x /usr/bin/wp

# Install AWS CLI
RUN apk add --no-cache aws-cli