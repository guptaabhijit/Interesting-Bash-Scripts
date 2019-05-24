#!/bin/bash
echo "It will remove all the containers and images from system"
dockerps=$(docker ps -aq)


if [ -z "$dockerps" ]
then
	echo "No docker containers found"
else
	echo $dockerps
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)
	#docker rmi $(docker ps -aq)
	docker image prune -af
	echo "done"
fi	

