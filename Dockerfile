FROM node:lts-alpine3.22

WORKDIR /app

# Instale PHP e extensões essenciais para CI/CD
RUN apk add --no-cache \
    php84 \
    php84-iconv \
    php84-ctype \
    php84-curl \
    php84-json \
    php84-mbstring \
    php84-openssl \
    php84-phar \
    php84-tokenizer \
    php84-xml \
    php84-xmlreader \
    php84-xmlwriter \
    php84-zip \
    php84-gd \
    php84-dom \
    php84-pdo \
    php84-pdo_sqlite \
    php84-mysqli \
    php84-mysqlnd \
    php84-simplexml \
    php84-posix \
    php84-soap \
    php84-sockets \
    php84-intl \
    php84-bcmath \
    php84-calendar \
    php84-exif \
    php84-fileinfo \
    php84-ftp \
    php84-shmop \
    php84-sodium \
    php84-sqlite3 \
    php84-opcache \
    php84-pecl-imagick \
    php84-pecl-igbinary \
    php84-gmp \
    php84-gettext \
    php84-pcntl \
    python3 py3-pip py3-setuptools \
    git \
    curl \
    jq \
    rsync \
    openssh-client \
    aws-cli \
 && rm -rf /var/cache/apk/* /root/.npm /root/.cache /tmp/* /root/.composer

# Crie um symlink para o binário php
RUN ln -s /usr/bin/php84 /usr/bin/php

# Instale Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer



ENV PYTHONUNBUFFERED=1
# Remove a pasta EXTERNALLY-MANAGED do Python 3.12
RUN mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/EXTERNALLY-MANAGED.old

# Install WP Cli
RUN cd /usr/bin && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv /usr/bin/wp-cli.phar /usr/bin/wp && \
    chmod +x /usr/bin/wp

# Limpe caches do pip e composer
RUN rm -rf /root/.cache/pip /root/.composer