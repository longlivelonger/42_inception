# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbronwyn <sbronwyn@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/10 18:41:21 by sbronwyn          #+#    #+#              #
#    Updated: 2022/05/13 00:18:44 by sbronwyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk add nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/certs/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt \
		-subj "/C=RU/ST=Moscow/L=Moscow/O=Inception/CN=localhost"

COPY ./wordpress.conf /etc/nginx/http.d/

CMD ["nginx", "-g", "daemon off;"]