FROM php:8.2-apache

# Combine apt-get update and apt-get install
RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        libicu-dev \
        libpng-dev \
        libjpeg-dev \
        libgmp-dev \
        libssl-dev \
        libc-client-dev \
        libkrb5-dev && \
    rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install mysqli imap gd zip

# Set PHP configuration
RUN echo "upload_max_filesize = 10M" > /usr/local/etc/php/conf.d/uploads.ini && \
    echo "post_max_size = 10M" >> /usr/local/etc/php/conf.d/uploads.ini && \
    echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini

# Enable Apache modules
RUN a2enmod rewrite

# Restart Apache
RUN service apache2 restart
