FROM composer/composer:1-php5

# Setup phpunit dependencies (including optional)
RUN docker-php-ext-install bcmath
RUN pecl install redis-2.2.8 xdebug && \
    docker-php-ext-enable redis && \
    docker-php-ext-enable xdebug

# Install the most recent stable phpunit.  This is more or less a fallback for
# the default use case.  It is expected that a project would specify its own
# phpunit dependency in its composer.json and that version of phpunit would be
# used instead.
RUN composer global require phpunit/phpunit:*

CMD ["phpunit"]
