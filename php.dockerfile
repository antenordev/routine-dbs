# PHP version:type
FROM php:7.4-apache
# PHP extensions common
#RUN \
    #apt-get update \
    #&& apt-get install -y \
        #unzip \
        #libfreetype6-dev \
        #libjpeg62-turbo-dev \
        #libpng-dev \
    #&& docker-php-ext-configure gd --with-freetype --with-jpeg \
    #&& docker-php-ext-install -j$(nproc) gd
# PHP packages
#RUN \
    #cd ~ \
    #&& curl -sS https://getcomposer.org/installer -o composer-setup.php \
    #&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer
# PHP extensions mysql with pdo
RUN \
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install \
	    pdo \
	    pdo_mysql \
	    mysqli \
    && docker-php-ext-enable pdo_mysql
RUN a2enmod rewrite