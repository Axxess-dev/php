FROM php:7.2-fpm
RUN apt-get update && apt-get install -my \
  git \
  nginx \
  supervisor \
  zlib1g-dev 
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql
COPY default /etc/nginx/sites-enabled/
COPY supervisord.conf /etc/supervisor/conf.d/
COPY composer /usr/local/bin/
COPY laravel /var/www/html/
RUN chown -R www-data /var/www/html/
RUN cd /var/www/html && composer install --optimize-autoloader --no-dev --no-interaction
CMD ["/usr/bin/supervisord"]
EXPOSE 80
