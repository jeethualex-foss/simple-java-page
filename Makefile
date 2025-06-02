app := simple-java-page
user :=
pass :=
image :=

default: login

publish: clean build deploy

login:
	docker login -u $(user) -p $(pass)

build:
	docker build -t $(image) .
	docker push $(image)

deploy:
	docker stop $(app) || true && docker rm $(app) || true
	docker run --name $(app) -d -p 80:80 $(image)

debug:
	docker exec -it $(app) sh

clean:
	docker stop $(app) || true && docker rm $(app) || true
	docker rmi $(image) -f
