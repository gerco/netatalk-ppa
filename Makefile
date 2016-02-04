default:


container:
	docker build -t netatalk-build .

local: container
	docker run -ti -v ~/.gnupg:/root/.gnupg:ro --name netatalk-build netatalk-build debuild -us -uc
	docker cp netatalk-build:/src/netatalk_3.1.8-0ppa3~wily_amd64.deb .
	docker rm netatalk-build

dist: container
	docker run --rm -ti -v ~/.gnupg:/root/.gnupg:ro netatalk-build

clean: rmcontainer rmimage

rmcontainer:
	docker rm netatalk-build

rmimage:
	docker rmi netatalk-build

docker-clean:
	docker ps -a | grep Exited | awk '{print $1}' | xargs docker rm

