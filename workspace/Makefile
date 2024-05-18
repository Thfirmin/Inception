NAME		:= inception
COMPOSE_FILE	:= ./srcs/docker-compose.yml

CONTAINER_NAME_MARIADB := mariadb
CONTAINER_TAG_MARIADB := inception
CONTAINER_NAME_WORDPRESS := wordpress
CONTAINER_TAG_WORDPRESS := inception

IP_ADDR = 0.0.0.0

DATA_PATH := ${HOME}/data

# About:
# Rule plug expects argument. Use like: make plug ARG=mariadb
# Rule connect expects argument. Use like: make connect ARG=bobby

all: ${NAME}

${NAME}: up

clean: down
	@printf "${TIME} ${INFO}Removing images\n"
	@docker images "${NAME}*" --format {{.ID}} | xargs -r docker rmi -f

fclean: clean
	@printf "${TIME} ${INFO}Remove specific volumes\n"
	@docker volume ls --filter "Name=${NAME}*" --format "{{.Name}}" | xargs -r docker volume rm
	@sudo rm -rf ${DATA_PATH}

re: fclean all

up:
	sudo mkdir -p ${DATA_PATH}/mariadb/
	sudo mkdir -p ${DATA_PATH}/wordpress/
	@docker-compose -p ${NAME} -f ${COMPOSE_FILE} up -d --build
	@docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"

down: stop	
	@docker-compose -p ${NAME} -f ${COMPOSE_FILE} down

stop:
	@docker-compose -p ${NAME} -f ${COMPOSE_FILE} stop

start:
	@docker-compose -p ${NAME} -f ${COMPOSE_FILE} start

log:
	@docker-compose -p ${NAME} -f ${COMPOSE_FILE} logs	

plug:
	@docker exec -it ${ARG} /bin/bash

connect:
	$(eval override IP_ADDR := $(shell docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${CONTAINER_NAME_MARIADB}))
	echo "mysql -h ${IP_ADDR} -P 3306 -u ${ARG} -p"

debug:
	@printf "${GOLD}██████████████████████ Containers ███████████████████████${RESET}\n"
	@docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
	@printf "${GOLD}██████████████████████   Images   ███████████████████████${RESET}\n"
	@docker images
	@printf "${GOLD}██████████████████████   Volumes  ███████████████████████${RESET}\n"
	@docker volume ls

.PHONY: all clean fclean re plug connect
