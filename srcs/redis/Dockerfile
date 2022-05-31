# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbronwyn <sbronwyn@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 01:12:59 by sbronwyn          #+#    #+#              #
#    Updated: 2022/06/01 02:00:31 by sbronwyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk add redis

COPY ./redis.conf /etc/redis.conf

CMD redis-server /etc/redis.conf