# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbronwyn <sbronwyn@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 17:57:53 by sbronwyn          #+#    #+#              #
#    Updated: 2022/06/25 00:54:22 by sbronwyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk add vsftpd

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY ./entrypoint.sh .
RUN touch setup.flag

EXPOSE 21

CMD sh entrypoint.sh