# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbronwyn <sbronwyn@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/10 21:44:48 by sbronwyn          #+#    #+#              #
#    Updated: 2022/06/24 23:54:07 by sbronwyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk add curl mariadb-client
RUN apk add php7 php7-fpm php7-mysqli php7-json php7-phar php7-curl php7-iconv php7-session

COPY ./www.conf /etc/php7/php-fpm.d/

WORKDIR /var/www
ADD https://wordpress.org/latest.tar.gz .
RUN tar -xzf latest.tar.gz && rm -f latest.tar.gz

RUN curl -s -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress
COPY ./wp-config.php .

RUN mkdir adminer
RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php --output ./adminer/index.php

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN touch setup.flag
ENTRYPOINT entrypoint.sh