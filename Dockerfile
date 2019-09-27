FROM nimmis/apache

# Modifiziert von
# Matthias Pröll <proell.matthias@gmail.com>
# Staudigl-Druck GmbH & Co. KG
# Letzte Anpassung: 2019/09/17

# Labels
LABEL vendor="Staudigl-Druck GmbH & Co. KG"
LABEL maintainer="Matthias Pröll (proell.matthias@gmail.com)"
LABEL release-date="2019-09-17"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install --no-install-recommends -y ssmtp mailutils php libapache2-mod-php  \
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
