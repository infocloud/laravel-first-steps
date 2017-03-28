FROM php:7
RUN apt-get update -y && apt-get install -y openssl zlib1g-dev
RUN docker-php-ext-install -j "$(nproc)" mbstring
WORKDIR /app
COPY composer.json /app
RUN composer install
COPY . /app
CMD php artisan serve --host=0.0.0.0 --port=8181
EXPOSE 8181
