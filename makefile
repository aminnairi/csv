.PHONY: start stop restart install development production

start:
	docker-compose up --detach

stop:
	docker-compose down --remove-orphans --volumes --timeout 0

restart: stop start

install: start

development: install
	docker-compose exec node npm run development

production: install
	docker-compose exec node npm run production

serve: production
	docker-compose exec node npm run serve
