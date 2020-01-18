FROM php:7-apache

# Setup Apache2 config
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

# Copy application source
COPY src /var/www/
RUN chown -R www-data:www-data /var/www

EXPOSE 80
EXPOSE 443
CMD ["start-apache"]
# CMD ["apache2-foreground"]
