## Inception Makefile

default: build up

build:
	cd srcs && docker compose build

up:
	cd srcs && docker compose up

down:
	cd srcs && docker compose down

re: fclean build up

clean:
	cd srcs && docker compose down

fclean:
	clean
	sudo rm -rf /home/mvolkman/data
