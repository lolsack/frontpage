project=scanf/lolsack.com

docker:
	docker build -t ${project} .
docker_deploy: docker docker_push
	echo "Pushed to docker"
docker_run: docker
	docker stop `docker ps | grep nginx|awk '{print $$1}'`
	docker run -dit -p 8282:80 ${project}
docker_push:
	docker push ${project}
