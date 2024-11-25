compose_up:
	docker compose up

compose_down:
	docker compose down

api_build:
	docker build -t backend ./backend 
	
api_up:
	docker run -dit --name be backend sh
	
api_down:
	docker stop be

api_rm: 
	docker rm be

api_destroy:
	docker rmi backend

.PHONY: compose_up compose_down api_build api_up api_down