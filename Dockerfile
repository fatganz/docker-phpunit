FROM nubs/phpunit

RUN docker-php-ext-install bcmath php-redis
