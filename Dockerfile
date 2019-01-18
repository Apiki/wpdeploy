FROM composer:latest

RUN apk --no-cache add yarn g++ make bash zlib-dev libpng-dev
RUN npm install -g n
RUN n lts