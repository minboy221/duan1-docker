FROM php:8.3-apache

# Cài extension kết nối MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy code vào container
COPY . /var/www/html/

# Bật rewrite
RUN a2enmod rewrite