project=scanf/lolsack.com

docker:
	docker build -t ${project} .
docker_deploy: docker docker_push
	echo "Pushed to docker"
docker_run: docker
	docker run -p 8282:80 ${project}
docker_push:
	docker push ${project}
