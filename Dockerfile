FROM nubs/phpunit

RUN docker-php-ext-install bcmath
RUN pecl install redis && \
    docker-php-ext-enable redis
