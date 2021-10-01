install:
	sudo docker-compose up --build && sudo docker container exec site_collab composer install
migrate:
	sudo docker container exec site_collab php artisan migrate
composer:
	sudo docker container exec site_collab composer install