## Inception Makefile

default: build up

build:
	cd srcs && docker compose build

up:
	cd srcs && docker compose up

down:
	cd srcs && docker compose down

fclean:
	cd srcs && docker compose down
	sudo rm -rf /home/mvolkman/data
