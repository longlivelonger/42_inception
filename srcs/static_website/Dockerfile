# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbronwyn <sbronwyn@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 17:17:14 by sbronwyn          #+#    #+#              #
#    Updated: 2022/06/24 22:37:16 by sbronwyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/main > /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN apk update && apk add rust cargo

COPY ./my-project/build /staticfiles
COPY ./static_server /app

WORKDIR /app
RUN cargo build --release

EXPOSE 8080

CMD /app/target/release/static_server