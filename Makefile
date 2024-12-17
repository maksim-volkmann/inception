# Default target
default: build up

# Build Docker images and create necessary directories
build:
	@echo "Checking and creating data directories if needed..."
	@if [ ! -d "/home/$(USER)/data/db" ]; then \
		echo "Creating /home/$(USER)/data/db"; \
		mkdir -p /home/$(USER)/data/db; \
		chmod 777 /home/$(USER)/data/db; \
	fi
	@if [ ! -d "/home/$(USER)/data/wp" ]; then \
		echo "Creating /home/$(USER)/data/wp"; \
		mkdir -p /home/$(USER)/data/wp; \
		chmod 777 /home/$(USER)/data/wp; \
	fi
	@echo "Building Docker images..."
	@cd srcs && docker compose build

# Start containers
up:
	@echo "Starting Docker containers..."
	@cd srcs && docker compose up -d

# Stop containers
stop:
	@echo "Stopping Docker containers..."
	@cd srcs && docker compose stop

# delete containers
down:
	@echo "Stopping Docker containers..."
	@cd srcs && docker compose down

# Deletes everything
fclean: down
	@echo "Cleaning up containers, images, volumes, and data directory..."

	@docker ps -aq | xargs -r docker rm -f >/dev/null 2>&1
	@docker images -q | xargs -r docker rmi -f >/dev/null 2>&1
	@docker volume ls -q | xargs -r docker volume rm -f >/dev/null 2>&1

	@if [ -d "/home/$(USER)/data" ]; then \
		sudo rm -rf /home/$(USER)/data >/dev/null 2>&1; \
		echo "Removed /home/$(USER)/data"; \
	else \
		echo "Directory /home/$(USER)/data does not exist."; \
	fi

	@echo "fclean completed successfully."


.PHONY: default build up down clean
