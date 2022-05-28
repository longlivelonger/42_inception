# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbronwyn <sbronwyn@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/10 21:49:02 by sbronwyn          #+#    #+#              #
#    Updated: 2022/05/18 19:17:17 by sbronwyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk add mariadb

COPY ./mariadb-server.cnf /etc/my.cnf.d/
COPY ./setup.sql .

VOLUME /var/lib/mysql

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD entrypoint.sh