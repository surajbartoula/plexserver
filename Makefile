all: plexserver

plexserver:
	docker-compose -f docker-compose.yml up --build -d

clean:
	docker-compose -f docker-compose.yml down --rmi all -v --remove-orphans 2>/dev/null || true

fclean: clean
	sudo rm -rf /home/sbartoul/plex/*
	docker rmi -f $$(docker images -a -q) 2> /dev/null || true
	docker volume prune -f

re: fclean all

.PHONY: all clean fclean re