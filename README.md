# hive-tez-docker-deploy
deploy hive on tez in docker

To start:

	make create

To login bash:

	make hive-bash

After starting the docker container with partial string `hive-server`, login the container bash and run bootstrap script of `/etc/hive-bootstrap.sh` to start hadoop and hive services.


To login hive:

	make hive-ql

**Please note** the hive server listening port of 10000 is not running. In addition, the hive is running in single server model on the localhost.  
