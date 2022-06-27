# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbronwyn <sbronwyn@student.21-school.ru>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/10 18:41:40 by sbronwyn          #+#    #+#              #
#    Updated: 2022/06/27 18:09:06 by sbronwyn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE_FILE=srcs/docker-compose.yml
ENV_FILE=srcs/.env

DATA_DIR=/home/sbronwyn/data

all: run

$(DATA_DIR)/wordpress:
	mkdir -p $(DATA_DIR)/wordpress
	
$(DATA_DIR)/mariadb:
	mkdir -p $(DATA_DIR)/mariadb
	
$(DATA_DIR): $(DATA_DIR)/wordpress $(DATA_DIR)/mariadb

run: $(DATA_DIR)
	DATA_DIR=$(DATA_DIR) docker compose -f $(DOCKER_COMPOSE_FILE) --env-file $(ENV_FILE) up

debug: $(DATA_DIR)
	DATA_DIR=$(DATA_DIR) docker compose -f $(DOCKER_COMPOSE_FILE) --env-file $(ENV_FILE) up --build

clean:
	DATA_DIR=$(DATA_DIR) docker compose -f $(DOCKER_COMPOSE_FILE) rm -fsv

fclean: clean
	docker system prune -a -f
	rm -rf $(DATA_DIR)

re: fclean run