# @version Tue May  7 19:32:20 2019
# reference https://github.com/big-data-europe/docker-hive

name=hive-dk1
image=bde2020/hive
host_dir=$(shell pwd)
stack_name=hc

create: compose

compose:
	docker-compose up -d

start:
	docker-compose start

stop:
	docker-compose stop

#delete volumes also
delete-all: 
	docker-compose down -v

delete:
	docker-compose down

hive-bash:
	docker-compose exec hive-server bash

hive-sql:
	docker-compose exec hive-server hive

deploy:
	docker stack deploy -c docker-compose.yml --with-registry-auth ${stack_name}

deploy-rm:
	docker stack rm ${stack_name}

deploy-ps:
	docker stack ps ${stack_name}

deploy-hive-bash:
	docker exec -it $$(docker ps | grep hive-server | awk '{print $$1}') bash

deploy-hive-sql:
	docker exec -it $$(docker ps | grep hive-server | awk '{print $$1}') hive

commit:
	git add -u
	git add .
	git commit -am 'make commit'
	git push
