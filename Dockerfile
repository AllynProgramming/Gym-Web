FROM php:8.1-apache

# Enable required PHP extensions for MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite for clean URLs
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy all files from repo to container
COPY . .

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 (HTTP)
EXPOSE 80

# Apache will start automatically
