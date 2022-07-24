
.PHONY: docker-build docker-shell print-build-args \
	default \
	print-docker-hub-image

SHELL=bash

default:
	echo pass

######
# docker stuff

REPO=adstewart

IMAGE_NAME=cits3007-gitpod

IMAGE_VERSION=0.1.0

print-image-name:
	@echo $(IMAGE_NAME)

print-image-version:
	@echo $(IMAGE_VERSION)

GIT_REF=$(shell git rev-parse HEAD)
GIT_COMMIT_DATE=$(shell git show -s --format=%cI $(GIT_REF))
GIT_TAGS=$(shell git tag -l)

print-build-args:
	@printf '%s %s\n' '--build-arg GIT_REF=$(GIT_REF)' \
		'--build-arg GIT_COMMIT_DATE=$(GIT_COMMIT_DATE)' \
		'--build-arg VERSION=$(IMAGE_VERSION)'

print-docker-hub-image:
	@printf '%s' "$(REPO)/$(IMAGE_NAME)"

docker-build:
	docker build \
		-f Dockerfile $(TAGS_TO_ADD) $(TAGS_IN) \
		-t $(REPO)/$(IMAGE_NAME):$(IMAGE_VERSION) .

docker-shell:
	docker -D run -e DISPLAY -it --rm  --net=host  \
		-v $$PWD:/work --workdir=/work \
		$(MOUNT)  $(DEVICES)  --env QT_X11_NO_MITSHM=1 \
		$(REPO)/$(IMAGE_NAME):$(IMAGE_VERSION) bash


