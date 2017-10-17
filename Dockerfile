FROM composer:1.4

RUN set -xe \
	&& apk update \
  && apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
  && docker-php-ext-install bcmath intl \
  && pecl install redis-3.1.2 xdebug && \
    docker-php-ext-enable redis xdebug bcmath \
  && apk del .build-deps

# Install the most recent stable phpunit.  This is more or less a fallback for
# the default use case.  It is expected that a project would specify its own
# phpunit dependency in its composer.json and that version of phpunit would be
# used instead.
RUN composer global require phpunit/phpunit:^5.7

ENTRYPOINT ["phpunit"]
