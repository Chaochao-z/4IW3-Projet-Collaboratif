install:
	sudo docker-compose up --build
	
migrate:
	sudo docker container exec site_collab php artisan migrate