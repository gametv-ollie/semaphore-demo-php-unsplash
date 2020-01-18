FROM php:7-apache

# Setup Apache2 config
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN a2dismod mpm_prefork

# Copy application source
COPY src /var/www/
RUN chown -R www-data:www-data /var/www

EXPOSE 80
EXPOSE 443
CMD ["apache2-foreground"]
