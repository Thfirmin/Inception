# Variables |===================================================================
DOCKER_COMPOSE = srcs/docker-compose.yml

TXT_BLACK = \033[30m
TXT_RED = \033[31m
TXT_GREEN = \033[32m
TXT_YELLOW = \033[33m
TXT_BLUE = \033[34m
TXT_MAGENTA = \033[35m
TXT_CYAN = \033[36m
TXT_GREY = \033[37m
TXT_WHITE = \033[38m
TXT_NULL = \033[0m

# Check sudo permission |=======================================================
.PHONY: check_sudo test

check_sudo:
	@if [ $$(id -u) -ne 0 ]; then \
		printf "[${TXT_RED}ERROR${TXT_NULL}] Root needed to execute this Makefile.\n" >&2; \
		exit 1; \
	fi

test: fclean
	docker build -t testing test/
	docker run -it -p 8000:80 -p 4430:443 testing

# Default make routine |========================================================
.PHONY: all clean break fclean re

.DEFAULT_GOAL := all

all: up

clean:
ifneq ($(shell docker container ls -qa 2>/dev/null),)
	@printf "[${TXT_YELLOW}WARNING${TXT_NULL}] Cleaning containers...\n"
	@docker stop $(shell docker container ls -qa)
	@docker rm $(shell docker container ls -qa)
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Containers has been cleanned...\n"
endif

break:
ifneq ($(shell docker volume ls -q 2>/dev/null),)
	@printf "[${TXT_YELLOW}WARNING${TXT_NULL}] Breaking volumes...\n"
	@docker volume rm $$(docker volume ls -q)
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Volumes has been break...\n"
endif
ifneq ($(shell docker network ls --filter type=custom -q 2>/dev/null),)
	@printf "[${TXT_YELLOW}WARNING${TXT_NULL}] Breaking networks...\n"
	@docker network rm $$(docker network ls --filter type=custom -q)
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Networks has been break...\n"
endif

fclean: clean break
ifneq ($(shell docker image ls -qa 2>/dev/null),)
	@printf "[${TXT_YELLOW}WARNING${TXT_NULL}] Deleting images...\n"
	@docker rmi $$(docker image ls -q)
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Images has been deleted...\n"
endif

re: fclean all


# Docker info rules |===========================================================
.PHONY: lsi lsa lsc lsn lsv ls logn logwp logm logs

lsi:
	@printf "/------------------|${TXT_YELLOW} DOCKER IMAGES ${TXT_NULL}|------------------\\ \n"
	@docker image ls ${LSI}

lsa: LSI=-a

lsa: lsi

lsc:
	@printf "/----------------|${TXT_GREEN} DOCKER CONTAINERS ${TXT_NULL}|----------------\\ \n"
	@docker container ls -a

lsn:
	@printf "/-----------------|${TXT_MAGENTA} DOCKER NETWORKS ${TXT_NULL}|-----------------\\ \n"
	@docker network ls --filter type=custom

lsv:
	@printf "/-----------------|${TXT_BLUE} DOCKER VOLUMES ${TXT_NULL}|------------------\\ \n"
	@docker volume ls

ls: lsi lsc lsn lsv

logn:
	@printf "${TXT_YELLOW}--------------------------------------------------\\ ${TXT_NULL}\n"
	@docker logs nginx | awk '{ printf "${TXT_YELLOW}%-13s|${TXT_NULL} %s\n", "nginx", $$LN ; }'
	@printf "${TXT_YELLOW}--------------------------------------------------/${TXT_NULL}\n"

logwp:
	@printf "${TXT_GREEN}--------------------------------------------------\\ ${TXT_NULL}\n"
	@docker logs wordpress | awk '{ printf "${TXT_GREEN}%-13s|${TXT_NULL} %s\n", "wordpress", $$LN ; }'
	@printf "${TXT_GREEN}--------------------------------------------------/${TXT_NULL}\n"

logm:
	@printf "${TXT_CYAN}--------------------------------------------------\\ ${TXT_NULL}\n"
	@docker logs mariadb | awk '{ printf "${TXT_CYAN}%-13s|${TXT_NULL} %s\n", "mariadb", $$LN ; }'
	@printf "${TXT_CYAN}--------------------------------------------------/${TXT_NULL}\n"
	
logs: logn logwp logm

# General service manager rules |===============================================
.PHONY: up down build run start stop restart

up:
	@printf "[${TXT_BLUE}INFO${TXT_NULL}] Turn up docker...\n"
	@docker-compose -f ${DOCKER_COMPOSE} up --build -d
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Docker was turned up...\n"

down:
	@printf "[${TXT_BLUE}INFO${TXT_NULL}] Turn down docker...\n"
	@docker-compose -f ${DOCKER_COMPOSE} down --rmi all --volumes --remove-orphans
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Docker was turned down...\n"

build:
	@printf "[${TXT_BLUE}INFO${TXT_NULL}] Building images...\n"
	@docker-compose -f ${DOCKER_COMPOSE} up --no-start
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Containers has been build...\n"

run:
	@printf "[${TXT_BLUE}INFO${TXT_NULL}] Running containers...\n"
	@docker-compose -f ${DOCKER_COMPOSE} up --no-build
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Containers has been run...\n"

start:
	@printf "[${TXT_BLUE}INFO${TXT_NULL}] Starting containers...\n"
	@docker-compose -f ${DOCKER_COMPOSE} start
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Containers was  started...\n"

stop:
	@printf "[${TXT_BLUE}INFO${TXT_NULL}] Stopping containers...\n"
	@docker-compose -f ${DOCKER_COMPOSE} stop
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Containers was stopped...\n"

pause:
	@printf "[${TXT_BLUE}INFO${TXT_NULL}] Pausing containers...\n"
	@docker-compose -f ${DOCKER_COMPOSE} pause
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Containers was pauseded...\n"

restart:
	@printf "[${TXT_BLUE}INFO${TXT_NULL}] Restarting containers...\n"
	@docker-compose -f ${DOCKER_COMPOSE} restart
	@printf "[${TXT_GREEN}SUCCESS${TXT_NULL}] Containers was restarted...\n"

