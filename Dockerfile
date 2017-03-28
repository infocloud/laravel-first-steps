FROM php:7
# install php composer
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# install mbstring and pdo extension
RUN docker-php-ext-install pdo mbstring
# set working dir
WORKDIR /app
# copy app files to working dir
COPY . /app
# run composer install
RUN composer install

CMD php artisan serve --host=0.0.0.0 --port=8181
EXPOSE 8181
