.PHONY: build
build:
	docker compose -f docker/docker-compose.yml build

.PHONY: run
run: build	
	docker compose -f docker/docker-compose.yml up

.PHONY: stop
stop:
	sudo docker stop \
			gptbot

.PHONY: down
down:
	docker compose -f docker/docker-compose.yml down \
			--volumes \
			--remove-orphans

.PHONY: count
count:
	find . -name tests -prune -o -type f -name '*.go' | xargs wc -l

.DEFAULT_GOAL := run