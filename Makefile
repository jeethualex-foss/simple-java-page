app := simple-java-page
user :=
pass :=
image :=

default: login

publish: clean build_api deploy_api build deploy

login:
	docker login -u $(user) -p $(pass)

build:
	docker build -t $(image) .
	docker push $(image)

build_api:
	docker build -t $(image)-api api
	docker push $(image)-api

deploy_api:
	docker stop api || true && docker rm api || true
	docker run --name api -d -p 8080:8080 $(image)-api

deploy:
	docker stop $(app) || true && docker rm $(app) || true
	docker run --name $(app) -d -p 80:80 $(image)

debug:
	docker exec -it $(app) sh

clean:
	docker stop api || true && docker rm api || true
	docker rmi $(image)-api -f
	docker stop $(app) || true && docker rm $(app) || true
	docker rmi $(image) -f
