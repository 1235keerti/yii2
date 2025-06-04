FROM php:8.3-fpm

# Install system dependencies and PHP extensions needed for Yii2 and Composer
RUN apt-get update && apt-get install -y \
    libpng-dev libonig-dev libxml2-dev zip unzip git curl \
    && docker-php-ext-install pdo_mysql mbstring xml gd

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Set working directory inside container
WORKDIR /var/www/html

# Copy application code into container
COPY app/ .

RUN git config --global --add safe.directory /var/www/html

# Install PHP dependencies using Composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Give permissions to web server user
RUN chown -R www-data:www-data /var/www/html

# Expose port 9000 for php-fpm
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]

