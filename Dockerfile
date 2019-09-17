FROM nimmis/apache

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# https://github.com/nimmis/docker-apache-php7/blob/master/Dockerfile

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y ssmtp mailutils php libapache2-mod-php  \
php-fpm php-cli php-mysqlnd php-pgsql php-sqlite3 php-redis \
php-apcu php-intl php-imagick php-mcrypt php-json php-gd php-curl && \
phpenmod mcrypt && \
apt purge logrotate -y && \
apt upgrade -y && \
apt autoremove -y && \
apt autoclean -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* && \
cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
