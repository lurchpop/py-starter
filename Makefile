locmd = docker-compose -f docker/docker-compose.yml
bold=$(shell tput bold)
normal=$(shell tput sgr0)

##todo make this work correctly
help: 
	@echo -e "Possible targets: \n\n\
 $(bold)build$(normal)\n\
 $(bold)up$(normal)\n\
 $(bold)down$(normal)\n\
 $(bold)restart$(normal)\n\
 $(bold)logs$(normal) - tail logs\n\
 $(bold)ps$(normal) - running containers\n\
 $(bold)sh$(normal) - step into running container\n\
 $(bold)clean$(normal) - run docker container prune, docker image prune, git gc\n"

up:
	$(locmd) up -d
	
down:
	$(locmd) down

build:
	$(locmd) build

logs:#todo make this work so when you ctrl+c it doesn't throw err
	$(locmd) logs -f
	
ps:
	$(locmd) ps
	
restart:
	make down
	make up
	
sh:
	$(locmd) exec app sh

clean:
	docker container prune -f;
	docker image prune -f
	git gc

