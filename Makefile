app := simple-java-page
user :=
pass :=
tag :=

default: login

publish: build deploy

login:
	docker login -u $(user) -p $(pass)

build:
	docker build -t $(tag) .
	docker push $(tag)

deploy:
	docker stop $(app) || true && docker rm $(app) || true
	docker run --name $(app) -d -p 80:80 $(tag)

debug:
	docker exec -it $(app) sh
