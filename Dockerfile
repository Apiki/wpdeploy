FROM composer:latest

RUN apk --no-cache add yarn g++ make bash zlib-dev libpng-dev