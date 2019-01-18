FROM composer:latest

RUN apk --no-cache add nodejs-current yarn g++ make bash zlib-dev libpng-dev