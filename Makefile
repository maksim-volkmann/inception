## Inception Makefile

default: build up

build:
	cd srcs && docker compose build

up:
	cd srcs && docker compose up -d

down:
	cd srcs && docker compose down

fclean:
	sudo rm -rf /home/mvolkman/data
	cd srcs && docker compose down
